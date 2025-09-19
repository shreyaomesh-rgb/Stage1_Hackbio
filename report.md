#Report file
Report: Whole-Genome Sequencing Analysis of the 2017–2018 South African Listeria monocytogenes Outbreak
1. Background

Between 2017 and 2018, South Africa faced the world’s largest recorded outbreak of listeriosis, primarily linked to processed cold meats (polony).

Cases reported (NICD): 978 laboratory-confirmed

Deaths: 183 (≈27% fatality rate)

Most affected: neonates, pregnant women, elderly, immunocompromised (notably HIV patients)

Geography: Gauteng (59%), Western Cape (12%), KwaZulu-Natal (7%)

Source: traced back to Enterprise Foods, Polokwane facility

International concern: products exported to 15 African countries

This unusually high mortality rate suggested that not only infection, but also antimicrobial resistance (AMR) and virulence/toxin factors may have contributed.

Whole-Genome Sequencing (WGS) provides the resolution needed to:

Confirm the outbreak pathogen identity.

Detect resistance genes and toxin/virulence determinants.

Provide evidence-based treatment recommendations.

2. Dataset

Input: ~100 bacterial isolates collected during the outbreak.

Subset analyzed: ~50 representative samples.

Data type: Illumina paired-end reads (FASTQ format).

3. Methodology
3.1 Download 50 samples from the dataset

#!/bin/bash

mkdir raw_reads
cd raw_reads


curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/016/SRR27013316/SRR27013316_1.fastq.gz -o SRR27013316_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/016/SRR27013316/SRR27013316_2.fastq.gz -o SRR27013316_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/015/SRR27013315/SRR27013315_1.fastq.gz -o SRR27013315_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/015/SRR27013315/SRR27013315_2.fastq.gz -o SRR27013315_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/014/SRR27013314/SRR27013314_1.fastq.gz -o SRR27013314_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/014/SRR27013314/SRR27013314_2.fastq.gz -o SRR27013314_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/013/SRR27013313/SRR27013313_1.fastq.gz -o SRR27013313_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/013/SRR27013313/SRR27013313_2.fastq.gz -o SRR27013313_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/012/SRR27013312/SRR27013312_1.fastq.gz -o SRR27013312_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/012/SRR27013312/SRR27013312_2.fastq.gz -o SRR27013312_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/011/SRR27013311/SRR27013311_1.fastq.gz -o SRR27013311_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/011/SRR27013311/SRR27013311_2.fastq.gz -o SRR27013311_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/042/SRR27013342/SRR27013342_1.fastq.gz -o SRR27013342_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/042/SRR27013342/SRR27013342_2.fastq.gz -o SRR27013342_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/040/SRR27013340/SRR27013340_1.fastq.gz -o SRR27013340_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/040/SRR27013340/SRR27013340_2.fastq.gz -o SRR27013340_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/039/SRR27013339/SRR27013339_1.fastq.gz -o SRR27013339_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/039/SRR27013339/SRR27013339_2.fastq.gz -o SRR27013339_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/038/SRR27013338/SRR27013338_1.fastq.gz -o SRR27013338_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/038/SRR27013338/SRR27013338_2.fastq.gz -o SRR27013338_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/043/SRR27013343/SRR27013343_1.fastq.gz -o SRR27013343_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/043/SRR27013343/SRR27013343_2.fastq.gz -o SRR27013343_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/041/SRR27013341/SRR27013341_1.fastq.gz -o SRR27013341_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/041/SRR27013341/SRR27013341_2.fastq.gz -o SRR27013341_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/037/SRR27013337/SRR27013337_1.fastq.gz -o SRR27013337_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/037/SRR27013337/SRR27013337_2.fastq.gz -o SRR27013337_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/035/SRR27013335/SRR27013335_1.fastq.gz -o SRR27013335_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/035/SRR27013335/SRR27013335_2.fastq.gz -o SRR27013335_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/036/SRR27013336/SRR27013336_1.fastq.gz -o SRR27013336_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/036/SRR27013336/SRR27013336_2.fastq.gz -o SRR27013336_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/034/SRR27013334/SRR27013334_1.fastq.gz -o SRR27013334_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/034/SRR27013334/SRR27013334_2.fastq.gz -o SRR27013334_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/033/SRR27013333/SRR27013333_1.fastq.gz -o SRR27013333_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/033/SRR27013333/SRR27013333_2.fastq.gz -o SRR27013333_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/032/SRR27013332/SRR27013332_1.fastq.gz -o SRR27013332_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/032/SRR27013332/SRR27013332_2.fastq.gz -o SRR27013332_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/031/SRR27013331/SRR27013331_1.fastq.gz -o SRR27013331_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/031/SRR27013331/SRR27013331_2.fastq.gz -o SRR27013331_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/030/SRR27013330/SRR27013330_1.fastq.gz -o SRR27013330_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/030/SRR27013330/SRR27013330_2.fastq.gz -o SRR27013330_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/029/SRR27013329/SRR27013329_1.fastq.gz -o SRR27013329_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/029/SRR27013329/SRR27013329_2.fastq.gz -o SRR27013329_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/028/SRR27013328/SRR27013328_1.fastq.gz -o SRR27013328_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/028/SRR27013328/SRR27013328_2.fastq.gz -o SRR27013328_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/027/SRR27013327/SRR27013327_1.fastq.gz -o SRR27013327_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/027/SRR27013327/SRR27013327_2.fastq.gz -o SRR27013327_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/026/SRR27013326/SRR27013326_1.fastq.gz -o SRR27013326_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/026/SRR27013326/SRR27013326_2.fastq.gz -o SRR27013326_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/025/SRR27013325/SRR27013325_1.fastq.gz -o SRR27013325_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/025/SRR27013325/SRR27013325_2.fastq.gz -o SRR27013325_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/023/SRR27013323/SRR27013323_1.fastq.gz -o SRR27013323_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/023/SRR27013323/SRR27013323_2.fastq.gz -o SRR27013323_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/024/SRR27013324/SRR27013324_1.fastq.gz -o SRR27013324_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/024/SRR27013324/SRR27013324_2.fastq.gz -o SRR27013324_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/022/SRR27013322/SRR27013322_1.fastq.gz -o SRR27013322_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/022/SRR27013322/SRR27013322_2.fastq.gz -o SRR27013322_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/021/SRR27013321/SRR27013321_1.fastq.gz -o SRR27013321_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/021/SRR27013321/SRR27013321_2.fastq.gz -o SRR27013321_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/020/SRR27013320/SRR27013320_1.fastq.gz -o SRR27013320_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/020/SRR27013320/SRR27013320_2.fastq.gz -o SRR27013320_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/019/SRR27013319/SRR27013319_1.fastq.gz -o SRR27013319_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/019/SRR27013319/SRR27013319_2.fastq.gz -o SRR27013319_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/018/SRR27013318/SRR27013318_1.fastq.gz -o SRR27013318_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/018/SRR27013318/SRR27013318_2.fastq.gz -o SRR27013318_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/009/SRR27013309/SRR27013309_1.fastq.gz -o SRR27013309_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/009/SRR27013309/SRR27013309_2.fastq.gz -o SRR27013309_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/010/SRR27013310/SRR27013310_1.fastq.gz -o SRR27013310_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/010/SRR27013310/SRR27013310_2.fastq.gz -o SRR27013310_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/017/SRR27013317/SRR27013317_1.fastq.gz -o SRR27013317_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/017/SRR27013317/SRR27013317_2.fastq.gz -o SRR27013317_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/008/SRR27013308/SRR27013308_1.fastq.gz -o SRR27013308_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/008/SRR27013308/SRR27013308_2.fastq.gz -o SRR27013308_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/007/SRR27013307/SRR27013307_1.fastq.gz -o SRR27013307_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/007/SRR27013307/SRR27013307_2.fastq.gz -o SRR27013307_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/005/SRR27013305/SRR27013305_1.fastq.gz -o SRR27013305_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/005/SRR27013305/SRR27013305_2.fastq.gz -o SRR27013305_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/003/SRR27013303/SRR27013303_1.fastq.gz -o SRR27013303_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/003/SRR27013303/SRR27013303_2.fastq.gz -o SRR27013303_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/006/SRR27013306/SRR27013306_1.fastq.gz -o SRR27013306_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/006/SRR27013306/SRR27013306_2.fastq.gz -o SRR27013306_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/004/SRR27013304/SRR27013304_1.fastq.gz -o SRR27013304_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/004/SRR27013304/SRR27013304_2.fastq.gz -o SRR27013304_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/002/SRR27013302/SRR27013302_1.fastq.gz -o SRR27013302_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/002/SRR27013302/SRR27013302_2.fastq.gz -o SRR27013302_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/001/SRR27013301/SRR27013301_1.fastq.gz -o SRR27013301_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/001/SRR27013301/SRR27013301_2.fastq.gz -o SRR27013301_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/000/SRR27013300/SRR27013300_1.fastq.gz -o SRR27013300_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/000/SRR27013300/SRR27013300_2.fastq.gz -o SRR27013300_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/097/SRR27013297/SRR27013297_1.fastq.gz -o SRR27013297_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/097/SRR27013297/SRR27013297_2.fastq.gz -o SRR27013297_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/098/SRR27013298/SRR27013298_1.fastq.gz -o SRR27013298_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/098/SRR27013298/SRR27013298_2.fastq.gz -o SRR27013298_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/099/SRR27013299/SRR27013299_1.fastq.gz -o SRR27013299_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/099/SRR27013299/SRR27013299_2.fastq.gz -o SRR27013299_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/096/SRR27013296/SRR27013296_1.fastq.gz -o SRR27013296_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/096/SRR27013296/SRR27013296_2.fastq.gz -o SRR27013296_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/095/SRR27013295/SRR27013295_1.fastq.gz -o SRR27013295_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/095/SRR27013295/SRR27013295_2.fastq.gz -o SRR27013295_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/094/SRR27013294/SRR27013294_1.fastq.gz -o SRR27013294_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/094/SRR27013294/SRR27013294_2.fastq.gz -o SRR27013294_Genome_Sequencing_of_Listeria_monocytogenes_SA_outbreak_2017_2.fastq.gz



3.2 Quality Control and Preprocessing

Tools used: FastQC and Fastp

Purpose: Assessed base quality, trimmed adapters, corrected sequencing errors.

#!/bin/bash
# ======================================================
# Quality Control with FastQC
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

# ======================================================
#Preprocessing with FastP
# ======================================================

!/bin/bash

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
        echo "Finished trimming sample $base"
    fi
done

echo "=== All samples processed with fastp ==="

3.3 Genome Assembly

Tool: SPAdes (de novo assembly with k=33,55, phred offset 33)

Output: Contigs per isolate

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

3.4 Assembly Assessment

Tool: QUAST

Metrics generated: N50, L50, GC content, total genome length (~2.9–3.1 Mbp, typical of L. monocytogenes).

!/bin/bash

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


3.5 Pathogen Confirmation

# ==============================
# Organism identification with BLAST
# ==============================

Approach: Representative contig BLAST against NCBI nt database

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

3.6  Antimicrobial Resistance Detection and Toxin screening

# ==============================
# AMR gene detection with ABRicate
# ==============================

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

echo "✓ Done. Results are in $ABRICATE_DIR/"

4. Results

4.1  Organism Identification

BLAST analysis showed almost 100 percent similarity with the pathogen Listeria monocytogenes.

Contig					Subject accesion		Percentage 	identity Organism
NODE_1_length_186027_cov_81.345945		CP196566.1		100		Listeria monocytogenes strain BL91/023
NODE_1_length_186027_cov_81.345945		CP110922.1		100		Listeria monocytogenes strain 11-04869
NODE_1_length_186027_cov_81.345945		CP111150.1		100		Listeria monocytogenes strain 19-02390
NODE_1_length_186027_cov_81.345945		CP115044.1		100		Listeria monocytogenes strain MKELm224_2022
NODE_1_length_186027_cov_81.345945		CP075871.1		100		Listeria monocytogenes strain 3BS29 chromosome

4.2  AMR Genes Identification

1.  fosX
The fosX gene directly confers resistance to fosfomycin, an antibiotic that can be used to treat gram-positive bacterial infections.
fosX gene was present in 100% of the L. innocua isolates examined in South Africa.
The fosX gene provides intrinsic fosfomycin resistance in Listeria species, including L. innocua and L. monocytogenes.

2. mprF
The mprF gene is known to be involved in the production of lysylphosphatidylglycerol (LPG), which is a key component of the bacterial cell membrane.
In S. aureus, the mprF gene is associated with resistance to daptomycin (DAP), an important antibiotic used to treat severe infections.

3. lin
The lin gene confers resistance to fosfomycin, a widely used antibiotic in livestock, particularly in South Africa
A 2023 study in the Gauteng province, South Africa, found the lin gene to be highly prevalent in Listeria innocua isolates from beef products.
100% prevalence was detected in L. innocua isolates from retail outlets.

4.norB
Specific substrates for the NorB pump include fluoroquinolones like levofloxacin and moxifloxacin.
Overexpression of the norB gene leads to the increased activity of its encoded efflux pump.
This increased pump activity helps bacteria extrude drugs and other toxic substances from the cell, preventing them from reaching their intracellular targets.

4.3  Toxin genes

actA , bsh , clpC , clpE , clpP , fbpA , gtcA , hly , hpt , iap/cwhA , inlA , inlB , inlC , inlF , inlJ , inlK , lap , lapB , llsA , llsB , llsD , llsG , llsH , llsP , llsX , llsY , lntA , lpeA , lplA1 , lspA , mpl , oatA ,  pdgA , plcA ,	plcB ,	prfA ,	prsA2 ,	vip

5. Public Health Implications

⦁	Food Safety is Paramount: The outbreak underscored the importance of stringent food safety regulations and practices in the processed meat industry.
⦁	Surveillance and Monitoring: Effective food safety surveillance is crucial for detecting and responding to outbreaks quickly.
⦁	Consumer Awareness: Educating consumers on food safety, particularly regarding ready-to-eat products like polony, is vital for reducing risks.
⦁	Need for Stronger Enforcement: The outbreak highlighted the need for stronger enforcement of food safety laws and increased capacity of food safety inspectors in South Africa.
