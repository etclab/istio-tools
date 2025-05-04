#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/config.sh"

# Save the current directory and move up two levels
pushd ../../ > /dev/null || { echo "Failed to change directory"; exit 1; }

# Loop over durations
for duration in "${DURATIONS[@]}"; do
    for label in "${EXTRA_LABELS[@]}"; do
        config_path="./experiments/no_istio/latency_${duration}s_${label}.yaml"
        
        if [[ -f $config_path ]]; then
            echo "▶ Running benchmark for duration=${duration}s"
            python runner/runner.py --config_file "$config_path"
        else
            echo "⚠️ Config file not found: $config_path"
        fi
    done
done

# Return to original directory
popd > /dev/null || exit
