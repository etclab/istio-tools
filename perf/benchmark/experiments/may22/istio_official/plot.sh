#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd ../../..

# modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both
# query_list=500,750,1000,1250,1500

python graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=qps --telemetry_modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both --query_list=500,750,1000,1250,1500 --query_str=NumThreads==4 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/cpu_mem-p90-240s.png

python graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=qps --telemetry_modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both --query_list=500,750,1000,1250,1500 --query_str=NumThreads==4 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/cpu_mem-p99-240s.png

python graph_plotter/graph_plotter.py --graph_type=latency-p999 --x_axis=qps --telemetry_modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both --query_list=500,750,1000,1250,1500 --query_str=NumThreads==4 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/cpu_mem-p999-240s.png

# cpu_client
python graph_plotter/graph_plotter.py --graph_type=cpu-client --x_axis=qps --telemetry_modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both --query_list=500,750,1000,1250,1500 --query_str=NumThreads==4 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/cpu_client-p90-240s.png

python graph_plotter/graph_plotter.py --graph_type=cpu-client --x_axis=qps --telemetry_modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both --query_list=500,750,1000,1250,1500 --query_str=NumThreads==4 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/cpu_client-p99-240s.png

python graph_plotter/graph_plotter.py --graph_type=cpu-client --x_axis=qps --telemetry_modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both --query_list=500,750,1000,1250,1500 --query_str=NumThreads==4 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/cpu_client-p999-240s.png

# cpu_server
python graph_plotter/graph_plotter.py --graph_type=cpu-server --x_axis=qps --telemetry_modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both --query_list=500,750,1000,1250,1500 --query_str=NumThreads==4 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/cpu_server-p90-240s.png

python graph_plotter/graph_plotter.py --graph_type=cpu-server --x_axis=qps --telemetry_modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both --query_list=500,750,1000,1250,1500 --query_str=NumThreads==4 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/cpu_server-p99-240s.png

python graph_plotter/graph_plotter.py --graph_type=cpu-server --x_axis=qps --telemetry_modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both --query_list=500,750,1000,1250,1500 --query_str=NumThreads==4 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/cpu_server-p999-240s.png

# mem_client
python graph_plotter/graph_plotter.py --graph_type=mem-client --x_axis=qps --telemetry_modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both --query_list=500,750,1000,1250,1500 --query_str=NumThreads==4 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/mem_client-p90-240s.png

python graph_plotter/graph_plotter.py --graph_type=mem-client --x_axis=qps --telemetry_modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both --query_list=500,750,1000,1250,1500 --query_str=NumThreads==4 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/mem_client-p99-240s.png

python graph_plotter/graph_plotter.py --graph_type=mem-client --x_axis=qps --telemetry_modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both --query_list=500,750,1000,1250,1500 --query_str=NumThreads==4 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/mem_client-p999-240s.png

# mem_server
python graph_plotter/graph_plotter.py --graph_type=mem-server --x_axis=qps --telemetry_modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both --query_list=500,750,1000,1250,1500 --query_str=NumThreads==4 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/mem_server-p90-240s.png

python graph_plotter/graph_plotter.py --graph_type=mem-server --x_axis=qps --telemetry_modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both --query_list=500,750,1000,1250,1500 --query_str=NumThreads==4 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/mem_server-p99-240s.png

python graph_plotter/graph_plotter.py --graph_type=mem-server --x_axis=qps --telemetry_modes=mazu_240s_w2_both,istio_plaintext_240s_w2_both,no_istio_240s_w2_no_istio,istio_mtls_240s_w2_both --query_list=500,750,1000,1250,1500 --query_str=NumThreads==4 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/mem_server-p999-240s.png

cd - 