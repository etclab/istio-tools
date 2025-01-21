# Setting up Performances Benchmark for Mazu


1. Clone the Istio-tools repository.
    ```
    git clone git@github.com:etclab/istio-tools.git
    ```
2. Create a Kubernetes Cluster

    See [resource requirement](../istio-install#resource-requirment) to make sure the cluster has enough resources

3. Istio Setup - [Link](https://github.com/istio/tools/tree/release-1.24/perf/istio-install#istio-setup)
    
    - Remove the configuration of IBM and GKE from `base/templates/prometheus-install.yaml`
    - Set `DOMAIN` as `export DOMAIN=local`
    - Set `VERSION` as `export VERSION=1.24.2` or `export TAG=latest`
    - `./setup_istio.sh`
        * **Potential Issue** - 
            ```
            + kubectl rollout status --watch --timeout=60s statefulset/prometheus-prometheus -n istio-prometheus
            Error from server (NotFound): statefulsets.apps "prometheus-prometheus" not found
            ```
            No action required. It'll pass in a few retries. 
    
4. Deploy the workloads to measure peformance against. The test environment is two Fortio pods (one client, one server). 
    ```
    export NAMESPACE=twopods
    export INTERCEPTION_MODE=REDIRECT
    export ISTIO_INJECT=true
    export LOAD_GEN_TYPE=fortio
    export DNS_DOMAIN=local
    ./setup_test.sh
    ```

    This will get stuck here -
    ```
    ...
    + kubectl rollout status deployment fortioclient -n $NAMESPACE --timeout=5m
    Waiting for deployment "fortioclient" rollout to finish: 0 of 1 updated replicas are available...
    ```
    
    This is happening because by default fortioclient wants to run in a node not running fortioserver. Hence need to remove that rule. 

    - First stop the pods in twopods
        ```
        # Assuming you are in perf/benchmark directory
        kubectl -n $NAMESPACE delete -f tmp/twopods.yaml
        ```
    - Edit the twopods.yaml to (1) remove the `podAffinity` rule, (2) broaden the `securityContext` to give full access (to prevent a write failure) and, (3) use a fortio with unix tools 
        
        1. To do so remove all the `podAffinity` blocks in the `tmp/twopods.yaml` file. 
        2. Edit the `securityContext` to have the following for all `securityContext` blocks:
            ```
            securityContext:
                allowPrivilegeEscalation: true
                runAsUser: 0
                runAsGroup: 0
                privileged: true 
            ```
        3. Modify the image value to use a modified fortio image that has basic unix tools. Make sure not to update the image for `shell` container.
            - Set the `image` from `fortio/fortio:latest_release` to `npankaj365/fortio-busybox:latest` 
    - Rerun the pods creation step
        ```
        # Assuming you are in the perf/benchmark directory
        kubectl -n $NAMESPACE apply -f tmp/twopods.yaml
        ```

    - Verify the two fortio pods are running successfully. 
        You should the two pods to be in `running` status. 
        ```
        kubectl -n $NAMESPACE get pods 
        ```

5. Prepare Python Environment
    ```
    cd perf/benchmark
    pipenv shell
    pipenv install
    ```

    * Testing the runner.py to see if it works
        ```
        python runner/runner.py --conn 2 --qps 100 --duration 120 --protocol_mode http --size 1024 --telemetry_mode v2-stats --load_gen_type fortio
        ```

    * Manual Fortio Run to verify file creation
        ```
        kubectl -n $NAMESPACE exec -it deployment/fortioclient -c uncaptured -- fortio load -data-dir=/var/lib/fortio -json=result.json -a -labels test_base http://fortioserver:8080/echo

        ```

    * Watching Results Folder
        ```
        kubectl -n $NAMESPACE exec -it deployment/fortioclient -c uncaptured -- watch -n 1 "ls -laR /var/lib/fortio"
        ```
    * Basic Fortio tests run to see if it outputs into `var/lib/fortio` as required
        ```
        kubectl -n $NAMESPACE exec -it deployment/fortioclient -c uncaptured -- fortio load -data-dir=/var/lib/fortio -a -labels test_base http://fortioserver:8080/echo
        ```

6. Run the tests

    Examples available [here](./perf/benchmark/README.md)
    ```
    python runner/runner.py --config_file ./configs/istio/telemetryv2_stats/latency.yaml
    ```
7. Gather Result Metrics

    - Set `FORTIO_CLIENT_URL` and `PROMETHEUS_URL`
        * Find out which port the Reporting Service listens to
        ```
        kubectl -n $NAMESPACE logs -l app=fortioclient -c captured
        ```

    * Use that port to setup this port forwarding
        (Assuming it was 8080)
        ```
        kubectl -n $NAMESPACE port-forward svc/fortioclient 9076:8080 &
        export FORTIO_CLIENT_URL=http://localhost:9076
        ```

    * Verify it's responding well
        ```
        curl $FORTIO_CLIENT_URL
        ```

    * Set `PROMETHEUS_URL`
        ```
        kubectl -n istio-prometheus port-forward svc/istio-prometheus 9090:9090 &
        export PROMETHEUS_URL=http://localhost:9090
        ```

    * Edit `runner/fortio.py` to use `uncaptured` instead of `shell`
        
        Find and replace the line
        ```
        get_fortio_json_cmd = "kubectl cp -c shell {namespace}/{fortioclient}:/var/lib/fortio {tempdir}"\
        .format(namespace=namespace, fortioclient=fortioclient_pod_name, tempdir=temp_dir_path)
        ```
        with the following:
        ```
        get_fortio_json_cmd = "kubectl cp -c uncaptured {namespace}/{fortioclient}:/var/lib/fortio {tempdir}"\
        .format(namespace=namespace, fortioclient=fortioclient_pod_name, tempdir=temp_dir_path)
        ```

    * Run `fortio.py`
        ``` 
        python ./runner/fortio.py $FORTIO_CLIENT_URL --prometheus=$PROMETHEUS_URL --csv StartTime,ActualDuration,Labels,NumThreads,ActualQPS,p50,p90,p99,p999,cpu_mili_avg_istio_proxy_fortioclient,cpu_mili_avg_istio_proxy_fortioserver,cpu_mili_avg_istio_proxy_istio-ingressgateway,mem_Mi_avg_istio_proxy_fortioclient,mem_Mi_avg_istio_proxy_fortioserver,mem_Mi_avg_istio_proxy_istio-ingressgateway

        ```

8. Plot the results

    For full details go through [Graph Plotter Readme.md](./perf/benchmark/graph_plotter/README.md)

    For instance, if the fortio runner was run with the following command:  
    ```
    python runner/runner.py --config_file ./configs/istio/telemetryv2_stats/latency.yaml
    ```
    The "Run `fortio.py`" step would emit a location for the csv output. Assuming the location is `/tmp/tmpn9snovhd.csv`, the plotter command would be:

    ```
    python3 ./graph_plotter/graph_plotter.py --graph_type=latency-p50 --x_axis=conn --telemetry_modes=istio_with_stats_both --query_list=2,4,8,16,32,64 --query_str=ActualQPS==1000 --csv_filepath=/tmp/tmpn9snovhd.csv --graph_title=./plotter_output.png
    ```

    Here the number of connections is plotted in the X-axis against Latency while looking at values with only 1000 QPS.

** Once the results are plotted, if the data generated is not relevant for further tests, remove the json outputs manually.

### Miscellaneous Commands
  - Forceful removal of all json outputs
  ```
  kubectl exec -it -n $NAMESPACE fortioclient-7684864568-9qdfw -c uncaptured -- sh -c 'rm /var/lib/fortio/*.json'
  ```
  - List all json
  ```
  kubectl exec -it -n $NAMESPACE deployment/fortioclient -c uncaptured -- sh -c 'ls -la /var/lib/fortio/*.json'

  kubectl exec -it -n $NAMESPACE deployment/fortioclient -c uncaptured -- sh -c 'ls -la /var/lib/fortio/'
  ```
