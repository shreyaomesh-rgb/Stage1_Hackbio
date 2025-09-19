# Stage1_Hackbio

# South African Listeriosis Outbreak (2017–2018) — WGS Analysis

## Project Overview
This repository contains analysis of whole-genome sequencing (WGS) data from the **2017–2018 South African polony outbreak**, the world’s largest recorded listeriosis outbreak.

**Objectives:**
- Confirm the outbreak pathogen identity
- Detect antimicrobial resistance (AMR) genes
- Identify virulence/toxin factors

---

## Dataset
- ~100 bacterial isolates (FASTQ paired-end reads)
- Downsampled to ~50 isolates for analysis

---

## Workflow

### 1. Quality Control
- Tools: `FastQC`, `fastp`
- Checked read quality and trimmed adapters

### 2. Assembly
- Tool: `SPAdes`
- Produced contigs per isolate

### 3. Assembly Assessment
- Tool: `QUAST`
- Reported N50, L50, GC%, genome length

### 4. Pathogen Confirmation
- Tool: `BLASTn` (remote search against NCBI `nt`)
- Confirmed **Listeria monocytogenes**

### 5. AMR Gene Detection and Virulence Factor Detection
- Tool: `ABRicate` (CARD database) and (VFBD database)
- Detected genes - fosX ,	Listeria_monocytogenes_mprF , lin , norB
- Found toxin genes actA , bsh , clpC , clpE , clpP , fbpA , gtcA , hly , hpt , iap/cwhA , inlA and more
---

## Results Summary
- **Confirmed pathogen:** *Listeria monocytogenes*
- **AMR genes detected and Virulence genes detected:


---

