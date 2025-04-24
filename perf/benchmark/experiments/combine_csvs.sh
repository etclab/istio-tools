# consolidates the csv data from different telemetry modes

exp_type="${EXP_TYPE:-cpu_mem}"

out_file_name="combined_${exp_type}.csv"
data_file_name="${exp_type}.csv.dat"

header="StartTime,ActualDuration,Labels,NumThreads,ActualQPS,p50,p90,p99,p999,cpu_mili_avg_istio_proxy_fortioclient,cpu_mili_avg_istio_proxy_fortioserver,cpu_mili_avg_istio_proxy_istio-ingressgateway,mem_Mi_avg_istio_proxy_fortioclient,mem_Mi_avg_istio_proxy_fortioserver,mem_Mi_avg_istio_proxy_istio-ingressgateway"

echo $header > "$out_file_name"

for mode in no_istio istio_mtls istio_plaintext; do
    file_path="${mode}/data/${data_file_name}"

    # add all lines except the header
    tail -n +2 -q $file_path >> "$out_file_name"
done
