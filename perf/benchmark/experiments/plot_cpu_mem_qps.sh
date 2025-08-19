#!/bin/bash
# Auto-generated script to plot cpu_mem graphs

# #--- p90 --- 
# python graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=qps --telemetry_modes=istio_mtls_120s_both,istio_plaintext_120s_both,no_istio_120s_no_istio,mazu_120s_both --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-p90-120s.png
# python graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=qps --telemetry_modes=istio_mtls_240s_both,istio_plaintext_240s_both,no_istio_240s_no_istio,mazu_240s_both --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-p90-240s.png
# python graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=qps --telemetry_modes=istio_mtls_480s_both,istio_plaintext_480s_both,no_istio_480s_no_istio,mazu_480s_both --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-p90-480s.png

# #--- p99 --- 
# python graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=qps --telemetry_modes=istio_mtls_120s_both,istio_plaintext_120s_both,no_istio_120s_no_istio,mazu_120s_both --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-p99-120s.png
# python graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=qps --telemetry_modes=istio_mtls_240s_both,istio_plaintext_240s_both,no_istio_240s_no_istio,mazu_240s_both --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-p99-240s.png
# python graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=qps --telemetry_modes=istio_mtls_480s_both,istio_plaintext_480s_both,no_istio_480s_no_istio,mazu_480s_both --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-p99-480s.png

# mazu_240s_ka_true_unc_true_both,istio_mtls_240s_w_unset_both,no_istio_240s_w_unset_no_istio,istio_plaintext_240s_w_unset_both

# python graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=qps --telemetry_modes=mazu_240s_ka_true_unc_true_both,istio_mtls_240s_w_unset_both,no_istio_240s_w_unset_no_istio,istio_plaintext_240s_w_unset_both --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/data/workers_unset/sorted_data.csv --graph_title=experiments/plots/new/cpu_mem-p90-full.png

# python graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=qps --telemetry_modes=mazu_240s_ka_true_unc_true_both,istio_mtls_240s_w_unset_both,no_istio_240s_w_unset_no_istio,istio_plaintext_240s_w_unset_both --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/data/workers_unset/sorted_data.csv --graph_title=experiments/plots/new/cpu_mem-p99-full.png

# python graph_plotter/graph_plotter.py --graph_type=latency-p999 --x_axis=qps --telemetry_modes=mazu_240s_ka_true_unc_true_both,istio_mtls_240s_w_unset_both,no_istio_240s_w_unset_no_istio,istio_plaintext_240s_w_unset_both --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/data/workers_unset/sorted_data.csv --graph_title=experiments/plots/new/cpu_mem-p999-full.png

# # ignore the first three records
# python graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=qps --telemetry_modes=mazu_240s_ka_true_unc_true_both,istio_mtls_240s_w_unset_both,no_istio_240s_w_unset_no_istio,istio_plaintext_240s_w_unset_both --query_list=1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/data/workers_unset/sorted_data.csv --graph_title=experiments/plots/new/cpu_mem-p90.png

# python graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=qps --telemetry_modes=mazu_240s_ka_true_unc_true_both,istio_mtls_240s_w_unset_both,no_istio_240s_w_unset_no_istio,istio_plaintext_240s_w_unset_both --query_list=1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/data/workers_unset/sorted_data.csv --graph_title=experiments/plots/new/cpu_mem-p99.png

# python graph_plotter/graph_plotter.py --graph_type=latency-p999 --x_axis=qps --telemetry_modes=mazu_240s_ka_true_unc_true_both,istio_mtls_240s_w_unset_both,no_istio_240s_w_unset_no_istio,istio_plaintext_240s_w_unset_both --query_list=1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/data/workers_unset/sorted_data.csv --graph_title=experiments/plots/new/cpu_mem-p999.png


# may 5
# mazu_240s_nc_false_both
# mazu_240s_unc_false_both
python graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=qps --telemetry_modes=mazu_240s_nc_false_both,istio_mtls_240s_w_unset_both,no_istio_240s_w_unset_no_istio,istio_plaintext_240s_w_unset_both,mazu_240s_unc_false_both,istio_mtls_240s_unc_false_both --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/data/may5/data.csv.dat --graph_title=experiments/plots/may5/cpu_mem-p90-full.png

python graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=qps --telemetry_modes=mazu_240s_nc_false_both,istio_mtls_240s_w_unset_both,no_istio_240s_w_unset_no_istio,istio_plaintext_240s_w_unset_both,mazu_240s_unc_false_both,istio_mtls_240s_unc_false_both --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/data/may5/data.csv.dat --graph_title=experiments/plots/may5/cpu_mem-p99-full.png

python graph_plotter/graph_plotter.py --graph_type=latency-p999 --x_axis=qps --telemetry_modes=mazu_240s_nc_false_both,istio_mtls_240s_w_unset_both,no_istio_240s_w_unset_no_istio,istio_plaintext_240s_w_unset_both,mazu_240s_unc_false_both,istio_mtls_240s_unc_false_both --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/data/may5/data.csv.dat --graph_title=experiments/plots/may5/cpu_mem-p999-full.png

# ignore the first three records
python graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=qps --telemetry_modes=mazu_240s_ka_true_unc_true_both,mazu_240s_nc_false_both,istio_mtls_240s_w_unset_both,no_istio_240s_w_unset_no_istio,istio_plaintext_240s_w_unset_both,mazu_240s_unc_false_both,istio_mtls_240s_unc_false_both --query_list=1000,2000,4000,8000,16000,20000,32000,50000,60000,80000,100000 --query_str=NumThreads==16 --csv_filepath=experiments/data/may5/data.csv.dat --graph_title=experiments/plots/may5/cpu_mem-p90.png

python graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=qps --telemetry_modes=mazu_240s_ka_true_unc_true_both,mazu_240s_nc_false_both,istio_mtls_240s_w_unset_both,no_istio_240s_w_unset_no_istio,istio_plaintext_240s_w_unset_both,mazu_240s_unc_false_both,istio_mtls_240s_unc_false_both --query_list=1000,2000,4000,8000,16000,20000,32000,50000,60000,80000,100000 --query_str=NumThreads==16 --csv_filepath=experiments/data/may5/data.csv.dat --graph_title=experiments/plots/may5/cpu_mem-p99.png

python graph_plotter/graph_plotter.py --graph_type=latency-p999 --x_axis=qps --telemetry_modes=mazu_240s_ka_true_unc_true_both,mazu_240s_nc_false_both,istio_mtls_240s_w_unset_both,no_istio_240s_w_unset_no_istio,istio_plaintext_240s_w_unset_both,mazu_240s_unc_false_both,istio_mtls_240s_unc_false_both --query_list=1000,2000,4000,8000,16000,20000,32000,50000,60000,80000,100000 --query_str=NumThreads==16 --csv_filepath=experiments/data/may5/data.csv.dat --graph_title=experiments/plots/may5/cpu_mem-p999.png

