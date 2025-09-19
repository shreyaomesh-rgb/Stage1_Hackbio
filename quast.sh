#!/bin/bash

# ==============================
# Assembly quality check with QUAST
# ==============================

# Create a folder to store all QUAST reports
mkdir -p quast_report

echo "=== Starting QUAST analysis for assembled genomes ==="

# Loop through each assembly directory
for dir in assembly2/*; do
    # Extract sample name from folder name
    sample=$(basename "$dir")

    echo "--------------------------------------------"
    echo "Processing sample: $sample"
    echo "Assembly directory: $dir"

    # Check if contigs.fasta exists
    if [[ ! -f "$dir/contigs.fasta" ]]; then
        echo "Skipping $sample: contigs.fasta not found"
        continue
    fi

    # Run QUAST on the contigs
    quast.py "$dir/contigs.fasta" -o "quast_report/${sample}" --threads 4

    # Check if QUAST succeeded
    if [[ $? -ne 0 ]]; then
        echo " Error: QUAST failed for $sample"
    else
        echo " QUAST completed for $sample"
        echo "Report saved in: quast_report/${sample}/report.html"
    fi
done

echo "=== All QUAST analyses finished ==="


