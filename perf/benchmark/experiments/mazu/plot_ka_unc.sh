# latency
python ../../graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=conn \
    --telemetry_modes=mazu_240s_ka_true_unc_false_both,mazu_240s_ka_false_unc_false_both,mazu_240s_ka_true_unc_true_both,mazu_240s_ka_false_unc_true_both \
    --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=data/workers_unset/sorted_data.csv --graph_title=plots/latency-p90-conn-full.png
    # --query_list=16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=data/workers_unset/sorted_data.csv --graph_title=plots/latency-p90-conn.png

python ../../graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=conn \
    --telemetry_modes=mazu_240s_ka_true_unc_false_both,mazu_240s_ka_false_unc_false_both,mazu_240s_ka_true_unc_true_both,mazu_240s_ka_false_unc_true_both \
    --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=data/workers_unset/sorted_data.csv --graph_title=plots/latency-p99-conn-full.png
    # --query_list=16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=data/workers_unset/sorted_data.csv --graph_title=plots/latency-p99-conn.png

python ../../graph_plotter/graph_plotter.py --graph_type=latency-p999 --x_axis=conn \
    --telemetry_modes=mazu_240s_ka_true_unc_false_both,mazu_240s_ka_false_unc_false_both,mazu_240s_ka_true_unc_true_both,mazu_240s_ka_false_unc_true_both \
    --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=data/workers_unset/sorted_data.csv --graph_title=plots/latency-p999-conn-full.png
    # --query_list=16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=data/workers_unset/sorted_data.csv --graph_title=plots/latency-p999-conn.png


# cpu_mem
python ../../graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=qps \
    --telemetry_modes=mazu_240s_ka_true_unc_false_both,mazu_240s_ka_false_unc_false_both,mazu_240s_ka_true_unc_true_both,mazu_240s_ka_false_unc_true_both \
    --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=data/workers_unset/qps.csv --graph_title=plots/latency-p90-qps-full.png
    # --query_list=1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=data/workers_unset/qps.csv --graph_title=plots/latency-p90-qps.png

python ../../graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=qps \
    --telemetry_modes=mazu_240s_ka_true_unc_false_both,mazu_240s_ka_false_unc_false_both,mazu_240s_ka_true_unc_true_both,mazu_240s_ka_false_unc_true_both \
    --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=data/workers_unset/qps.csv --graph_title=plots/latency-p99-qps-full.png
    # --query_list=1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=data/workers_unset/qps.csv --graph_title=plots/latency-p99-qps.png

python ../../graph_plotter/graph_plotter.py --graph_type=latency-p999 --x_axis=qps \
    --telemetry_modes=mazu_240s_ka_true_unc_false_both,mazu_240s_ka_false_unc_false_both,mazu_240s_ka_true_unc_true_both,mazu_240s_ka_false_unc_true_both \
    --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=data/workers_unset/qps.csv --graph_title=plots/latency-p999-qps-full.png
    # --query_list=1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=data/workers_unset/qps.csv --graph_title=plots/latency-p999-qps.png
