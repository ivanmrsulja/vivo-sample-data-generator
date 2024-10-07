#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input.ttl>"
  exit 1
fi

INPUT_FILE="$1"
FILE_SIZE_LIMIT=30000000  # 30MB in bytes
LINES_PER_CHUNK=10000  # Process 10,000 lines at a time
COUNTER=1
CURRENT_SIZE=0
OUTPUT_FILE="output_part_${COUNTER}.ttl"
OFFSET=8

create_new_file() {
  OUTPUT_FILE="sample_data_${COUNTER}.ttl"
  echo "Creating new file: $OUTPUT_FILE"
  head -n 8 "$INPUT_FILE" > "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
  CURRENT_SIZE=$(wc -c < "$OUTPUT_FILE")
  COUNTER=$((COUNTER + 1))
}

create_new_file

while true; do
  CHUNK=$(tail -n +$((OFFSET + 1)) "$INPUT_FILE" | head -n $LINES_PER_CHUNK)
  
  if [[ -z "$CHUNK" ]]; then
    break
  fi

  CHUNK_SIZE=$(echo -n "$CHUNK" | wc -c)

  if (( CURRENT_SIZE + CHUNK_SIZE > FILE_SIZE_LIMIT )); then
    create_new_file
  fi
  
  echo "$CHUNK" >> "$OUTPUT_FILE"
  CURRENT_SIZE=$((CURRENT_SIZE + CHUNK_SIZE))

  OFFSET=$((OFFSET + LINES_PER_CHUNK))
done

echo "File split completed. Please check files for any sudden breaks in the triples."
