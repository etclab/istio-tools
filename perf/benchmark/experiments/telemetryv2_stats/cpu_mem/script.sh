# run the benchmarks
python runner/runner.py --config_file ./configs/istio/telemetryv2_stats/cpu_mem.yaml

python runner/runner.py --config_file ./configs/istio/telemetryv2_stats/cpu_mem_0.yaml


# get the results
python ./runner/fortio.py $FORTIO_CLIENT_URL --prometheus=$PROMETHEUS_URL --csv StartTime,ActualDuration,Labels,NumThreads,ActualQPS,p50,p90,p99,p999,cpu_mili_avg_istio_proxy_fortioclient,cpu_mili_avg_istio_proxy_fortioserver,cpu_mili_avg_istio_proxy_istio-ingressgateway,mem_Mi_avg_istio_proxy_fortioclient,mem_Mi_avg_istio_proxy_fortioserver,mem_Mi_avg_istio_proxy_istio-ingressgateway


# plot the results
python graph_plotter/graph_plotter.py --graph_type=latency-p50 --x_axis=qps --telemetry_modes=v2-stats-nullvm_both --query_list=10,100,200,400,800,1000 --query_str=NumThreads==16 --csv_filepath=./experiments/telemetryv2_stats/cpu_mem/data.csv --graph_title=./experiments/telemetryv2_stats/cpu_mem/plots/latency-p50.png

python graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=qps --telemetry_modes=v2-stats-nullvm_both --query_list=10,100,200,400,800,1000 --query_str=NumThreads==16 --csv_filepath=./experiments/telemetryv2_stats/cpu_mem/data.csv --graph_title=./experiments/telemetryv2_stats/cpu_mem/plots/latency-p90.png

python graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=qps --telemetry_modes=v2-stats-nullvm_both --query_list=10,100,200,400,800,1000 --query_str=NumThreads==16 --csv_filepath=./experiments/telemetryv2_stats/cpu_mem/data.csv --graph_title=./experiments/telemetryv2_stats/cpu_mem/plots/latency-p99.png

python graph_plotter/graph_plotter.py --graph_type=latency-p999 --x_axis=qps --telemetry_modes=v2-stats-nullvm_both --query_list=10,100,200,400,800,1000 --query_str=NumThreads==16 --csv_filepath=./experiments/telemetryv2_stats/cpu_mem/data.csv --graph_title=./experiments/telemetryv2_stats/cpu_mem/plots/latency-p999.png