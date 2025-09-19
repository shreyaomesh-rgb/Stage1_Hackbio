#!/bin/bash

#!/bin/bash

# ==============================
# Genome assembly with SPAdes
# ==============================

# Create output directory if it doesn't exist
mkdir -p assembly2

echo "=== Starting genome assembly with SPAdes ==="

# Loop through all R1 trimmed reads
for r1 in trimmed_reads/*_1_trimmed.fastq.gz; do
    # Find the matching R2 file
    r2="${r1/_1_trimmed.fastq.gz/_2_trimmed.fastq.gz}"
    
    # Extract sample name from file (everything before _1_trimmed.fastq.gz)
    sample=$(basename "$r1" _1_trimmed.fastq.gz)

    echo "--------------------------------------------"
    echo "Processing sample: $sample"
    echo "R1: $r1"
    echo "R2: $r2"

    # Check if R2 exists
    if [[ ! -f "$r2" ]]; then
        echo "Skipping $sample: Missing pair file ($r2 not found)"
        continue
    fi

    # Run SPAdes with phred 33 (Illumina default), k-mer sizes 33 and 55
    spades.py \
        -1 "$r1" \
        -2 "$r2" \
        -k 33,55 \
        --phred-offset 33 \
        -o "assembly2/$sample"

    # Check exit status of SPAdes
    if [[ $? -ne 0 ]]; then
        echo " Error: SPAdes failed for $sample"
    else
        echo " Assembly completed for $sample"
        echo "Output directory: assembly2/$sample"
    fi
done

echo "=== All assemblies finished ==="
