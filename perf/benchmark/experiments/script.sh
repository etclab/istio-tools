# --- 

DNS_DOMAIN=pc833.emulab.net VERSION=1.24.0 ./setup_istio.sh

export NAMESPACE=twopods-istio
export INTERCEPTION_MODE=REDIRECT
export ISTIO_INJECT=true
export LOAD_GEN_TYPE=fortio
export DNS_DOMAIN=pc833.emulab.net

./get_proxy_perf.sh -p fortioclient-6988cbf5f9-24cxh -n twopods-istio -d 20 -f 99
./get_proxy_perf.sh -p fortioserver-656c4f4f9b-8xrts -n twopods-istio -d 20 -f 99


python graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=qps --telemetry_modes=istio_mtls_120s_both --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-p90-120s.png