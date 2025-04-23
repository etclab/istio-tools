# run the benchmarks
python runner/runner.py --config_file ./experiments/istio_mtls/cpu_mem.yaml

# get the results
python ./runner/fortio.py $FORTIO_CLIENT_URL --prometheus=$PROMETHEUS_URL --csv StartTime,ActualDuration,Labels,NumThreads,ActualQPS,p50,p90,p99,p999,cpu_mili_avg_istio_proxy_fortioclient,cpu_mili_avg_istio_proxy_fortioserver,cpu_mili_avg_istio_proxy_istio-ingressgateway,mem_Mi_avg_istio_proxy_fortioclient,mem_Mi_avg_istio_proxy_fortioserver,mem_Mi_avg_istio_proxy_istio-ingressgateway


# plot the results