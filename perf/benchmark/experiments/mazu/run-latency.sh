#!/bin/bash

# Save the current directory and move up two levels
pushd ../../ > /dev/null || { echo "Failed to change directory"; exit 1; }

# Loop over durations
for duration in 120 240 480; do
    config_path="./experiments/mazu/latency_${duration}s.yaml"
    
    if [[ -f $config_path ]]; then
        echo "▶ Running benchmark for duration=${duration}s"
        python runner/runner.py --config_file "$config_path"
    else
        echo "⚠️ Config file not found: $config_path"
    fi
done


# Return to original directory
popd > /dev/null || exit
