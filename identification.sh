#!/bin/bash

ASSEMBLY_PATHS=("assembly2" "assembly_fixed")
BLAST_OUT="blast_check"
mkdir -p "$BLAST_OUT"

echo ">>> Running BLAST organism identification on all assemblies..."

# Loop through all contigs.fasta files
for contigs in $(find "${ASSEMBLY_PATHS[@]}" -type f -name "contigs.fasta"); do
    sample=$(basename "$(dirname "$contigs")")
    query="$BLAST_OUT/${sample}_query.fasta"
    out="$BLAST_OUT/${sample}_blast.tsv"

    echo ">>> Processing sample: $sample"

    # Extract the first 200 lines (to avoid huge BLAST jobs)
    head -n 200 "$contigs" > "$query"

    # Run BLAST
    blastn -query "$query" -db nt -remote \
           -outfmt "6 std stitle" \
           -max_target_seqs 5 \
           -evalue 1e-40 \
           -out "$out"

    if [[ -s "$out" ]]; then
        echo "✓ BLAST complete for $sample"
        echo "Top hit:"
        head -1 "$out"
    else
        echo "✗ BLAST failed for $sample"
    fi
done

echo ">>> All BLAST jobs finished."

