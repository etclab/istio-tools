#!/bin/bash
# Auto-generated script to plot cpu_mem graphs

#--- to plot: cpu-client --- 
python graph_plotter/graph_plotter.py --graph_type=cpu-client --x_axis=qps --telemetry_modes=istio_mtls_120s_both,istio_plaintext_120s_both,no_istio_120s_no_istio --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-cpu-client-120s.png
python graph_plotter/graph_plotter.py --graph_type=cpu-client --x_axis=qps --telemetry_modes=istio_mtls_240s_both,istio_plaintext_240s_both,no_istio_240s_no_istio --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-cpu-client-240s.png
python graph_plotter/graph_plotter.py --graph_type=cpu-client --x_axis=qps --telemetry_modes=istio_mtls_480s_both,istio_plaintext_480s_both,no_istio_480s_no_istio --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-cpu-client-480s.png

#--- to plot: cpu-server --- 
python graph_plotter/graph_plotter.py --graph_type=cpu-server --x_axis=qps --telemetry_modes=istio_mtls_120s_both,istio_plaintext_120s_both,no_istio_120s_no_istio --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-cpu-server-120s.png
python graph_plotter/graph_plotter.py --graph_type=cpu-server --x_axis=qps --telemetry_modes=istio_mtls_240s_both,istio_plaintext_240s_both,no_istio_240s_no_istio --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-cpu-server-240s.png
python graph_plotter/graph_plotter.py --graph_type=cpu-server --x_axis=qps --telemetry_modes=istio_mtls_480s_both,istio_plaintext_480s_both,no_istio_480s_no_istio --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-cpu-server-480s.png

#--- to plot: mem-client --- 
python graph_plotter/graph_plotter.py --graph_type=mem-client --x_axis=qps --telemetry_modes=istio_mtls_120s_both,istio_plaintext_120s_both,no_istio_120s_no_istio --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-mem-client-120s.png
python graph_plotter/graph_plotter.py --graph_type=mem-client --x_axis=qps --telemetry_modes=istio_mtls_240s_both,istio_plaintext_240s_both,no_istio_240s_no_istio --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-mem-client-240s.png
python graph_plotter/graph_plotter.py --graph_type=mem-client --x_axis=qps --telemetry_modes=istio_mtls_480s_both,istio_plaintext_480s_both,no_istio_480s_no_istio --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-mem-client-480s.png

#--- to plot: mem-server --- 
python graph_plotter/graph_plotter.py --graph_type=mem-server --x_axis=qps --telemetry_modes=istio_mtls_120s_both,istio_plaintext_120s_both,no_istio_120s_no_istio --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-mem-server-120s.png
python graph_plotter/graph_plotter.py --graph_type=mem-server --x_axis=qps --telemetry_modes=istio_mtls_240s_both,istio_plaintext_240s_both,no_istio_240s_no_istio --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-mem-server-240s.png
python graph_plotter/graph_plotter.py --graph_type=mem-server --x_axis=qps --telemetry_modes=istio_mtls_480s_both,istio_plaintext_480s_both,no_istio_480s_no_istio --query_list=100,250,500,1000,2000,4000,8000,16000 --query_str=NumThreads==16 --csv_filepath=experiments/combined_cpu_mem.csv.dat --graph_title=experiments/plots/cpu_mem/cpu_mem-mem-server-480s.png

# Auto-generated script to plot latency graphs

#--- to plot: cpu-client --- 
python graph_plotter/graph_plotter.py --graph_type=cpu-client --x_axis=conn --telemetry_modes=istio_mtls_120s_both,istio_plaintext_120s_both,no_istio_120s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-cpu-client-120s.png
python graph_plotter/graph_plotter.py --graph_type=cpu-client --x_axis=conn --telemetry_modes=istio_mtls_240s_both,istio_plaintext_240s_both,no_istio_240s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-cpu-client-240s.png
python graph_plotter/graph_plotter.py --graph_type=cpu-client --x_axis=conn --telemetry_modes=istio_mtls_480s_both,istio_plaintext_480s_both,no_istio_480s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-cpu-client-480s.png

#--- to plot: cpu-server --- 
python graph_plotter/graph_plotter.py --graph_type=cpu-server --x_axis=conn --telemetry_modes=istio_mtls_120s_both,istio_plaintext_120s_both,no_istio_120s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-cpu-server-120s.png
python graph_plotter/graph_plotter.py --graph_type=cpu-server --x_axis=conn --telemetry_modes=istio_mtls_240s_both,istio_plaintext_240s_both,no_istio_240s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-cpu-server-240s.png
python graph_plotter/graph_plotter.py --graph_type=cpu-server --x_axis=conn --telemetry_modes=istio_mtls_480s_both,istio_plaintext_480s_both,no_istio_480s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-cpu-server-480s.png

#--- to plot: mem-client --- 
python graph_plotter/graph_plotter.py --graph_type=mem-client --x_axis=conn --telemetry_modes=istio_mtls_120s_both,istio_plaintext_120s_both,no_istio_120s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-mem-client-120s.png
python graph_plotter/graph_plotter.py --graph_type=mem-client --x_axis=conn --telemetry_modes=istio_mtls_240s_both,istio_plaintext_240s_both,no_istio_240s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-mem-client-240s.png
python graph_plotter/graph_plotter.py --graph_type=mem-client --x_axis=conn --telemetry_modes=istio_mtls_480s_both,istio_plaintext_480s_both,no_istio_480s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-mem-client-480s.png

#--- to plot: mem-server --- 
python graph_plotter/graph_plotter.py --graph_type=mem-server --x_axis=conn --telemetry_modes=istio_mtls_120s_both,istio_plaintext_120s_both,no_istio_120s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-mem-server-120s.png
python graph_plotter/graph_plotter.py --graph_type=mem-server --x_axis=conn --telemetry_modes=istio_mtls_240s_both,istio_plaintext_240s_both,no_istio_240s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-mem-server-240s.png
python graph_plotter/graph_plotter.py --graph_type=mem-server --x_axis=conn --telemetry_modes=istio_mtls_480s_both,istio_plaintext_480s_both,no_istio_480s_no_istio --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-mem-server-480s.png

