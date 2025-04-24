# generates the scripts to plot the results for experiments
# run with: EXP_TYPE={cpu_mem,latency} ./prepare-plot-cmds.sh

exp_type="${EXP_TYPE:-cpu_mem}"

query_list="100,250,500,1000,2000,4000,8000,16000"
query_str="NumThreads==16"
x_axis="qps"

if [[ "$exp_type" == "latency" ]]; then
    query_list="2,4,8,16,32,64,128,256"
    query_str="ActualQPS==1000"
    x_axis="conn"
fi

# Output script file
output_script="plot_${exp_type}.sh"
echo "#!/bin/bash" > "$output_script"
echo "# Auto-generated script to plot ${exp_type} graphs" >> "$output_script"
echo "" >> "$output_script"

# generate commands to plot p90, p99 for cpu_mem data at 120s, 240s, 480s
for percentile in p90 p99; do
    echo "#--- ${percentile} --- " >> "$output_script"
    for duration in 120s 240s 480s; do
        graph_type="latency-${percentile}"
        telemetry_modes="istio_mtls_${duration}_both,istio_plaintext_${duration}_both,no_istio_${duration}_no_istio"
        output_file="experiments/plots/${exp_type}/${exp_type}-${percentile}-${duration}.png"

        cmd="python graph_plotter/graph_plotter.py --graph_type=${graph_type} --x_axis=${x_axis} \
--telemetry_modes=${telemetry_modes} \
--query_list=${query_list} \
--query_str=${query_str} --csv_filepath=experiments/combined_${exp_type}.csv.dat \
--graph_title=${output_file}"

        echo "$cmd" >> "$output_script"
    done
    echo "" >> "$output_script"
done

chmod +x "$output_script"
echo "Generated script: $output_script"
