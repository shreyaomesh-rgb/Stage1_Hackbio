#!/bin/bash
# ======================================================
# Step 1: Quality Control with FastQC
# Project: South African Polony Listeria Outbreak WGS
# ======================================================

# Input/output directories
RAW_DIR="raw_reads"
OUT_DIR="fastqc_report"

echo "=== FASTQC STEP STARTED ==="

# 1. Check if input folder exists
if [ ! -d "$RAW_DIR" ]; then
    echo "ERROR: Input folder '$RAW_DIR' not found!"
    exit 1
fi

# 2. Create output folder if it doesn’t exist
mkdir -p "$OUT_DIR"
echo "Output directory set to: $OUT_DIR"

# 3. Find all FASTQ files
FASTQ_FILES=($RAW_DIR/*.fastq.gz)

if [ ${#FASTQ_FILES[@]} -eq 0 ]; then
    echo "ERROR: No FASTQ files found in '$RAW_DIR'"
    exit 1
fi

# 4. Run FastQC
echo "Running FastQC on ${#FASTQ_FILES[@]} files..."
fastqc -t 8 "${FASTQ_FILES[@]}" -o "$OUT_DIR"

# 5. Check exit code
if [ $? -eq 0 ]; then
    echo "✓ FastQC completed successfully."
    echo "Reports saved in: $OUT_DIR"
else
    echo "✗ FastQC encountered an error. Check logs."
    exit 1
fi

echo "=== FASTQC STEP COMPLETED ==="
