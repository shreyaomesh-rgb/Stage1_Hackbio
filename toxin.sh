#!/bin/bash

ABRICATE_DIR="AMR"

# Create subfolders for results
mkdir -p "$ABRICATE_DIR/amr" "$ABRICATE_DIR/toxin" "$ABRICATE_DIR/summary"

# Loop over both assembly directories
for ASSEMBLY_DIR in assembly2 assembly_fixed; do
    echo "=== Processing directory: $ASSEMBLY_DIR ==="

    for assembly_dir in "$ASSEMBLY_DIR"/*; do
        sample=$(basename "$assembly_dir")
        contigs="$assembly_dir/contigs.fasta"

        if [[ -s "$contigs" ]]; then
            echo "  Running ABRicate for $sample..."

            # AMR (CARD)
            abricate --db card "$contigs" > "$ABRICATE_DIR/amr/${sample}_amr.tsv"

            # Virulence (VFDB)
            abricate --db vfdb "$contigs" > "$ABRICATE_DIR/toxin/${sample}_toxin.tsv"
        else
            echo "  Skipping $sample (no contigs.fasta)"
        fi
    done
done

# Summaries
echo "=== Generating summaries ==="
abricate --summary "$ABRICATE_DIR/amr"/*.tsv > "$ABRICATE_DIR/summary/amr_summary.tsv"
abricate --summary "$ABRICATE_DIR/toxin"/*.tsv > "$ABRICATE_DIR/summary/toxin_summary.tsv"

echo "✓ Done. Results are in $ABRICATE_DIR/"
