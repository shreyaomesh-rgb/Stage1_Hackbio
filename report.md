1. Background

Between 2017 and 2018, South Africa faced the world’s largest recorded outbreak of listeriosis, primarily linked to processed cold meats (polony).Cases reported (NICD): 978 laboratory-confirmed
Deaths: 183 (≈27% fatality rate) and Most affected: neonates, pregnant women, elderly, and immunocompromised (especially HIV-positive patients), Geography: Gauteng (59%), Western Cape (12%), KwaZulu-Natal (7%), Source: Enterprise Foods, Polokwane facility (products distributed to 15 African countries), The unusually high mortality suggested that not only infection, but also antimicrobial resistance (AMR) and virulence/toxin factors contributed to disease severity. Whole-genome sequencing (WGS) provides the high-resolution view necessary to:

2. Dataset

Input: ~100 bacterial isolates collected during the outbreak.
Subset analyzed: ~50 representative samples.
Data type: Illumina paired-end reads (FASTQ format).

3. Methodology
  3.1 Download 50 samples from the dataset
  
        #!/bin/bash
        mkdir raw_reads
        cd raw_reads
      
        #Example of downloading paired-end reads
        curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/<Path>/<SampleID>/<SampleID>_1.fastq.gz -o raw_reads/<SampleID>_1.fastq.gz
        curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/<Path>/<SampleID>/<SampleID>_2.fastq.gz -o raw_reads/<SampleID>_2.fastq.gz 


  3.2 Quality Control and Preprocessing
  
  Tools used: FastQC and Fastp
  Purpose: Assessed base quality, trimmed adapters, corrected sequencing errors.


    #!/bin/bash
    # ======================================================
    # Quality Control with FastQC
    # ======================================================
    
    RAW_DIR="raw_reads"
    OUT_DIR="fastqc_report"
    
    echo "=== FASTQC STEP STARTED ==="
    
    if [ ! -d "$RAW_DIR" ]; then
      echo "ERROR: Input folder '$RAW_DIR' not found!"
      exit 1
    fi
    
    mkdir -p "$OUT_DIR"
    echo "Output directory set to: $OUT_DIR"
    
    FASTQ_FILES=($RAW_DIR/*.fastq.gz)
    
    if [ ${#FASTQ_FILES[@]} -eq 0 ]; then
      echo "ERROR: No FASTQ files found in '$RAW_DIR'"
      exit 1
    fi
    
    echo "Running FastQC on ${#FASTQ_FILES[@]} files..."
    fastqc -t 8 "${FASTQ_FILES[@]}" -o "$OUT_DIR"
    
    if [ $? -eq 0 ]; then
      echo "✓ FastQC completed successfully."
      echo "Reports saved in: $OUT_DIR"
    else
      echo "✗ FastQC encountered an error. Check logs."
      exit 1
    fi
    
    echo "=== FASTQC STEP COMPLETED ==="

  
    #!/bin/bash
    # ======================================================
    # Preprocessing with Fastp
    # ======================================================
    
    mkdir -p trimmed_reads
    echo "=== Starting read trimming with fastp ==="
    
    for r1 in raw_reads/*_1.fastq.gz; do
      base=$(basename "$r1" _1.fastq.gz)
      r2="raw_reads/${base}_2.fastq.gz"
    
      echo "Processing sample: $base"
    
      if [[ ! -f "$r2" ]]; then
        echo "Skipping $base: Missing pair file ($r2 not found)"
        continue
      fi
    
      fastp \
        -i "$r1" \
        -I "$r2" \
        -o "trimmed_reads/${base}_1_trimmed.fastq.gz" \
        -O "trimmed_reads/${base}_2_trimmed.fastq.gz" \
        --html "trimmed_reads/${base}_fastp_report.html" \
        --thread 4
    
      if [[ $? -ne 0 ]]; then
        echo "✗ Error trimming sample $base"
      else
        echo "✓ Finished trimming sample $base"
      fi
    done
    
    echo "=== All samples processed with fastp ==="

  3.3 Genome assembly

    #!/bin/bash
    # ======================================================
    # Genome Assembly with SPAdes
    # ======================================================
    
    mkdir -p assembly2
    echo "=== Starting genome assembly with SPAdes ==="
    
    for r1 in trimmed_reads/*_1_trimmed.fastq.gz; do
      r2="${r1/_1_trimmed.fastq.gz/_2_trimmed.fastq.gz}"
      sample=$(basename "$r1" _1_trimmed.fastq.gz)
    
      echo "--------------------------------------------"
      echo "Processing sample: $sample"
      echo "R1: $r1"
      echo "R2: $r2"
    
      if [[ ! -f "$r2" ]]; then
        echo "Skipping $sample: Missing pair file ($r2 not found)"
        continue
      fi
    
      spades.py \
        -1 "$r1" \
        -2 "$r2" \
        --phred-offset 33 \
        -k 33,55 \
        -o "assembly2/$sample"
    
      if [[ $? -ne 0 ]]; then
        echo "✗ Error: SPAdes failed for $sample"
      else
        echo "✓ Assembly completed for $sample"
        echo "Output directory: assembly2/$sample"
      fi
    done
    
    echo "=== All assemblies finished ==="

  
  3.4 Assembly Assessment
  
  Tool: QUAST
  Metrics generated: N50, L50, GC content, total genome length (~2.9–3.1 Mbp, typical of L. monocytogenes).
  
 
    #!/bin/bash
    
    #==============================
    #Assembly quality check with QUAST
    #==============================
    
    #Create a folder to store all QUAST reports
    mkdir -p quast_report
    
    echo "=== Starting QUAST analysis for assembled genomes ==="
    
    #Loop through each assembly directory
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


  3.5 Pathogen Confirmation
  
  #==============================
  #Organism identification with BLAST
  #==============================
  
  Approach: Representative contig BLAST against NCBI nt database
  

    #!/bin/bash
    
    ASSEMBLY_PATHS=("assembly2" "assembly_fixed")
    BLAST_OUT="blast_check"
    mkdir -p "$BLAST_OUT"
    
    echo ">>> Running BLAST organism identification on all assemblies..."
    
    #Loop through all contigs.fasta files
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

  3.6  Antimicrobial Resistance Detection and Toxin screening
  
  #==============================
  #AMR gene detection with ABRicate
  #==============================
  
  Tool: ABRicate (CARD database) and (VFDB database)
  
  
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
    
    echo "Done. Results are in $ABRICATE_DIR/" 

4. Results
  4.1  Organism Identification
  
  BLAST analysis showed almost 100 percent similarity with the pathogen Listeria monocytogenes.
  
  Contig	Subject accesion	Percentage identity 	Organism
  NODE_1_length_186027_cov_81.345945	CP196566.1	100	Listeria monocytogenes strain BL91/023 
  NODE_1_length_186027_cov_81.345945	CP110922.1	100	Listeria monocytogenes strain 11-04869 
  NODE_1_length_186027_cov_81.345945	CP111150.1	100	Listeria monocytogenes strain 19-02390 
  NODE_1_length_186027_cov_81.345945	CP115044.1	100	Listeria monocytogenes strain MKELm224_2022
  NODE_1_length_186027_cov_81.345945	CP075871.1	100	Listeria monocytogenes strain 3BS29 chromosome
  <img width="1752" height="229" alt="image" src="https://github.com/user-attachments/assets/68d7107e-4ddc-434b-a21c-4e5f8495673e" />
  

  4.2  AMR Genes Identification
  
  AMR gene	Prevalence	Resistance
  FosX	100% (all isolates)	fosfomycin
  mprF	moderate prevalence	Alters cell membrane and cause daptomycin tolerance & immune evasion
  lin 	moderate prevalence	lincosamide
  norB	High prevalence	Efflux-mediated reduced susceptibility to fluoroquinolones
  <img width="1718" height="191" alt="image" src="https://github.com/user-attachments/assets/83d7d8f9-553c-412c-9c63-2271168335b5" />


  4.3  Toxin genes
  
  actA , bsh , clpC , clpE , clpP , fbpA , gtcA , hly , hpt , iap/cwhA , inlA , inlB , inlC , inlF , inlJ , inlK , lap , lapB , llsA , llsB , llsD , llsG , llsH , llsP , llsX , llsY , lntA , lpeA , lplA1 , lspA , mpl , oatA ,  pdgA , plcA ,	plcB ,	prfA ,	prsA2 ,	vip

5. Discussion and Public Health Implications
   
   5.1 Antibiotic Recommendations
   Ampicillin + Gentamicin → still effective standard treatment; no resistance genes detected against β-lactams or aminoglycosides.
   Avoid fosfomycin, fluoroquinolones, lincosamides → due to presence of fosX, norB, lin.
   mprF presence → indicates possible difficulty with host immune clearance and reduced efficacy of membrane-targeting drugs, but doesn’t negate ampicillin use.

   5.2 Public Health Implications
   ⦁	Food Safety is Paramount: The outbreak underscored the importance of stringent food safety regulations and practices in the processed meat industry.
   ⦁	Surveillance and Monitoring: Effective food safety surveillance is crucial for detecting and responding to outbreaks quickly.
   ⦁	Consumer Awareness: Educating consumers on food safety, particularly regarding ready-to-eat products like polony, is vital for reducing risks.
   ⦁	Need for Stronger Enforcement: The outbreak highlighted the need for stronger enforcement of food safety laws and increased capacity of food safety inspectors in South Africa.



