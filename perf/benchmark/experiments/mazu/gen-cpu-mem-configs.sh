#!/bin/bash

# Usage: ./gen-cpu-mem-configs.sh

# Find the config relative to *this* script’s location,
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/config.sh"

INPUT_FILE="cpu_mem.yaml"

if [[ ! -f $INPUT_FILE ]]; then
  echo "Error: $INPUT_FILE not found!"
  exit 1
fi

for DURATION in "${DURATIONS[@]}"; do
  for LABEL in "${EXTRA_LABELS[@]}"; do
    OUTPUT_FILE="cpu_mem_${DURATION}s_${LABEL}.yaml"

    sed -e "s/^duration: .*/duration: ${DURATION}/" \
        -e "s/^extra_labels: .*/extra_labels: \"${DURATION}s_${LABEL}\"/" \
        "$INPUT_FILE" > "$OUTPUT_FILE"

    echo "✅ Generated: $OUTPUT_FILE"
  done
done
