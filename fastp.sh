#!/bin/bash

# Create output directory for trimmed reads
mkdir -p trimmed_reads

echo "=== Starting read trimming with fastp ==="

# Loop through all R1 files in raw_reads
for r1 in raw_reads/*_1.fastq.gz; do
    # Extract the base sample name (everything before _1.fastq.gz)
    base=$(basename "$r1" _1.fastq.gz)
    r2="raw_reads/${base}_2.fastq.gz"

    echo "Processing sample: $base"

    # Check if R2 file exists before running fastp
    if [[ ! -f "$r2" ]]; then
        echo "Skipping $base: Missing pair file ($r2 not found)"
        continue
    fi

    # Run fastp
    fastp \
        -i "$r1" \
        -I "$r2" \
        -o "trimmed_reads/${base}_1_trimmed.fastq.gz" \
        -O "trimmed_reads/${base}_2_trimmed.fastq.gz" \
        --html "trimmed_reads/${base}_fastp_report.html" \
        --thread 4

    # Check if fastp ran successfully
    if [[ $? -ne 0 ]]; then
        echo " Error trimming sample $base"
    else
        echo " Finished trimming sample $base"
    fi
done

echo "=== All samples processed with fastp ==="

