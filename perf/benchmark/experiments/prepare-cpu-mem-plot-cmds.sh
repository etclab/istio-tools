# generates the scripts to plot the results for experiments
# run with: EXP_TYPE={cpu_mem,latency} ./prepare-cpu-mem-plot-cmds.sh

exp_type="${EXP_TYPE:-cpu_mem}"

query_list="100,250,500,1000,2000,4000,8000,16000"
query_str="NumThreads==16"
x_axis="qps"

# Output script file
output_script="plot_client_server_cpu_mem.sh"
echo "#!/bin/bash" > "$output_script"
echo "# Auto-generated script to plot ${exp_type} graphs" >> "$output_script"
echo "" >> "$output_script"

# generate commands to plot client/server for cpu_mem data at 120s, 240s, 480s
for graph_for in cpu-client cpu-server mem-client mem-server; do
    echo "#--- to plot: ${graph_for} --- " >> "$output_script"
    for duration in 120s 240s 480s; do
        telemetry_modes="istio_mtls_${duration}_both,istio_plaintext_${duration}_both,no_istio_${duration}_no_istio,mazu_${duration}_both"
        output_file="experiments/plots/${exp_type}/${exp_type}-${graph_for}-${duration}.png"

        cmd="python graph_plotter/graph_plotter.py --graph_type=${graph_for} --x_axis=${x_axis} \
--telemetry_modes=${telemetry_modes} \
--query_list=${query_list} \
--query_str=${query_str} --csv_filepath=experiments/combined_${exp_type}.csv.dat \
--graph_title=${output_file}"

        echo "$cmd" >> "$output_script"
    done
    echo "" >> "$output_script"
done

exp_type="latency"
query_list="2,4,8,16,32,64,128,256"
query_str="ActualQPS==1000"
x_axis="conn"

echo "# Auto-generated script to plot ${exp_type} graphs" >> "$output_script"
echo "" >> "$output_script"

# generate commands to plot client/server for cpu_mem data at 120s, 240s, 480s
for graph_for in cpu-client cpu-server mem-client mem-server; do
    echo "#--- to plot: ${graph_for} --- " >> "$output_script"
    for duration in 120s 240s 480s; do
        telemetry_modes="istio_mtls_${duration}_both,istio_plaintext_${duration}_both,no_istio_${duration}_no_istio,mazu_${duration}_both"
        output_file="experiments/plots/${exp_type}/${exp_type}-${graph_for}-${duration}.png"

        cmd="python graph_plotter/graph_plotter.py --graph_type=${graph_for} --x_axis=${x_axis} \
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
