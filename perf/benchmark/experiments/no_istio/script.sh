# run the benchmarks
python runner/runner.py --config_file ./experiments/no_istio/cpu_mem.yaml

# get the results
python ./runner/fortio.py $FORTIO_CLIENT_URL --prometheus=$PROMETHEUS_URL --csv StartTime,ActualDuration,Labels,NumThreads,ActualQPS,p50,p90,p99,p999,cpu_mili_avg_istio_proxy_fortioclient,cpu_mili_avg_istio_proxy_fortioserver,cpu_mili_avg_istio_proxy_istio-ingressgateway,mem_Mi_avg_istio_proxy_fortioclient,mem_Mi_avg_istio_proxy_fortioserver,mem_Mi_avg_istio_proxy_istio-ingressgateway


# plot the results

python graph_plotter/graph_plotter.py --graph_type=latency-p50 --x_axis=conn --telemetry_modes=no_istio_120s_no_istio,no_istio_240s_no_istio,no_istio_480s_no_istio,no_istio_960s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/no_istio/data/data.csv --graph_title=experiments/no_istio/figs/latency-p50.png

python graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=conn --telemetry_modes=no_istio_120s_no_istio,no_istio_240s_no_istio,no_istio_480s_no_istio,no_istio_960s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/no_istio/data/data.csv --graph_title=experiments/no_istio/figs/latency-p90.png

python graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=conn --telemetry_modes=no_istio_120s_no_istio,no_istio_240s_no_istio,no_istio_480s_no_istio,no_istio_960s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/no_istio/data/data.csv --graph_title=experiments/no_istio/figs/latency-p99.png

python graph_plotter/graph_plotter.py --graph_type=latency-p999 --x_axis=conn --telemetry_modes=no_istio_120s_no_istio,no_istio_240s_no_istio,no_istio_480s_no_istio,no_istio_960s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/no_istio/data/data.csv --graph_title=experiments/no_istio/figs/latency-p999.png