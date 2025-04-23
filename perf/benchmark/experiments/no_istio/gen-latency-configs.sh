#!/bin/bash

# Usage: ./gen-latency-configs.sh

INPUT_FILE="latency.yaml"
DURATIONS=(120 240 480 960) # in seconds

if [[ ! -f $INPUT_FILE ]]; then
  echo "Error: $INPUT_FILE not found!"
  exit 1
fi

for DURATION in "${DURATIONS[@]}"; do
  OUTPUT_FILE="latency_${DURATION}s.yaml"

  sed -e "s/^duration: .*/duration: ${DURATION}/" \
      -e "s/^extra_labels: .*/extra_labels: \"${DURATION}s\"/" \
      "$INPUT_FILE" > "$OUTPUT_FILE"

  echo "✅ Generated: $OUTPUT_FILE"
done
