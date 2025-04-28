#!/bin/bash
# Auto-generated script to plot latency graphs

#--- p90 --- 
python graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=conn --telemetry_modes=istio_mtls_120s_both,istio_plaintext_120s_both,no_istio_120s_no_istio,mazu_120s_both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-p90-120s.png
python graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=conn --telemetry_modes=istio_mtls_240s_both,istio_plaintext_240s_both,no_istio_240s_no_istio,mazu_240s_both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-p90-240s.png
python graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=conn --telemetry_modes=istio_mtls_480s_both,istio_plaintext_480s_both,no_istio_480s_no_istio,mazu_480s_both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-p90-480s.png

#--- p99 --- 
python graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=conn --telemetry_modes=istio_mtls_120s_both,istio_plaintext_120s_both,no_istio_120s_no_istio,mazu_120s_both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-p99-120s.png
python graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=conn --telemetry_modes=istio_mtls_240s_both,istio_plaintext_240s_both,no_istio_240s_no_istio,mazu_240s_both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-p99-240s.png
python graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=conn --telemetry_modes=istio_mtls_480s_both,istio_plaintext_480s_both,no_istio_480s_no_istio,mazu_480s_both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=experiments/combined_latency.csv.dat --graph_title=experiments/plots/latency/latency-p99-480s.png
