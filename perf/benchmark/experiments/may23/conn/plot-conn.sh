#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd ../../../

# modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both
# query_list=2,4,8,16,32,64,128,256
# query_str=ActualQPS==1000

# latency
python graph_plotter/graph_plotter.py --graph_type=latency-p50 --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/latency-p50-240s.png

python graph_plotter/graph_plotter.py --graph_type=latency-p90 --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/latency-p90-240s.png

python graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/latency-p99-240s.png

python graph_plotter/graph_plotter.py --graph_type=latency-p99 --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/latency-p99-240s-part.png

python graph_plotter/graph_plotter.py --graph_type=latency-p999 --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/latency-p999-240s.png

# cpu_client
python graph_plotter/graph_plotter.py --graph_type=cpu-client --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/cpu_client-p90-240s.png

python graph_plotter/graph_plotter.py --graph_type=cpu-client --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/cpu_client-p99-240s.png

python graph_plotter/graph_plotter.py --graph_type=cpu-client --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/cpu_client-p999-240s.png

# cpu_server
python graph_plotter/graph_plotter.py --graph_type=cpu-server --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/cpu_server-p90-240s.png

python graph_plotter/graph_plotter.py --graph_type=cpu-server --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/cpu_server-p99-240s.png

python graph_plotter/graph_plotter.py --graph_type=cpu-server --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/cpu_server-p999-240s.png

# mem_client
python graph_plotter/graph_plotter.py --graph_type=mem-client --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/mem_client-p90-240s.png

python graph_plotter/graph_plotter.py --graph_type=mem-client --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/mem_client-p99-240s.png

python graph_plotter/graph_plotter.py --graph_type=mem-client --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/mem_client-p999-240s.png

# mem_server
python graph_plotter/graph_plotter.py --graph_type=mem-server --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/mem_server-p90-240s.png

python graph_plotter/graph_plotter.py --graph_type=mem-server --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/mem_server-p99-240s.png

python graph_plotter/graph_plotter.py --graph_type=mem-server --x_axis=conn --telemetry_modes=mazu_240s__both,istio_plaintext_240s__both,no_istio_240s__no_istio,istio_mtls_240s__both --query_list=2,4,8,16,32,64,128,256 --query_str=ActualQPS==1000 --csv_filepath=$SCRIPT_DIR/sorted_data.csv.dat --graph_title=$SCRIPT_DIR/mem_server-p999-240s.png

cd - 