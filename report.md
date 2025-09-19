\#Report file

Report: Whole-Genome Sequencing Analysis of the 2017–2018 South African Listeria monocytogenes Outbreak

1\. Background



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



2\. Dataset



Input: ~100 bacterial isolates collected during the outbreak.



Subset analyzed: ~50 representative samples.



Data type: Illumina paired-end reads (FASTQ format).



3\. Methodology

3.1 Download 50 samples from the dataset



\#!/bin/bash



mkdir raw\_reads

cd raw\_reads





curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/016/SRR27013316/SRR27013316\_1.fastq.gz -o SRR27013316\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/016/SRR27013316/SRR27013316\_2.fastq.gz -o SRR27013316\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/015/SRR27013315/SRR27013315\_1.fastq.gz -o SRR27013315\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/015/SRR27013315/SRR27013315\_2.fastq.gz -o SRR27013315\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/014/SRR27013314/SRR27013314\_1.fastq.gz -o SRR27013314\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/014/SRR27013314/SRR27013314\_2.fastq.gz -o SRR27013314\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/013/SRR27013313/SRR27013313\_1.fastq.gz -o SRR27013313\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/013/SRR27013313/SRR27013313\_2.fastq.gz -o SRR27013313\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/012/SRR27013312/SRR27013312\_1.fastq.gz -o SRR27013312\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/012/SRR27013312/SRR27013312\_2.fastq.gz -o SRR27013312\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/011/SRR27013311/SRR27013311\_1.fastq.gz -o SRR27013311\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/011/SRR27013311/SRR27013311\_2.fastq.gz -o SRR27013311\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/042/SRR27013342/SRR27013342\_1.fastq.gz -o SRR27013342\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/042/SRR27013342/SRR27013342\_2.fastq.gz -o SRR27013342\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/040/SRR27013340/SRR27013340\_1.fastq.gz -o SRR27013340\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/040/SRR27013340/SRR27013340\_2.fastq.gz -o SRR27013340\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/039/SRR27013339/SRR27013339\_1.fastq.gz -o SRR27013339\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/039/SRR27013339/SRR27013339\_2.fastq.gz -o SRR27013339\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/038/SRR27013338/SRR27013338\_1.fastq.gz -o SRR27013338\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/038/SRR27013338/SRR27013338\_2.fastq.gz -o SRR27013338\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/043/SRR27013343/SRR27013343\_1.fastq.gz -o SRR27013343\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/043/SRR27013343/SRR27013343\_2.fastq.gz -o SRR27013343\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/041/SRR27013341/SRR27013341\_1.fastq.gz -o SRR27013341\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/041/SRR27013341/SRR27013341\_2.fastq.gz -o SRR27013341\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/037/SRR27013337/SRR27013337\_1.fastq.gz -o SRR27013337\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/037/SRR27013337/SRR27013337\_2.fastq.gz -o SRR27013337\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/035/SRR27013335/SRR27013335\_1.fastq.gz -o SRR27013335\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/035/SRR27013335/SRR27013335\_2.fastq.gz -o SRR27013335\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/036/SRR27013336/SRR27013336\_1.fastq.gz -o SRR27013336\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/036/SRR27013336/SRR27013336\_2.fastq.gz -o SRR27013336\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/034/SRR27013334/SRR27013334\_1.fastq.gz -o SRR27013334\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/034/SRR27013334/SRR27013334\_2.fastq.gz -o SRR27013334\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/033/SRR27013333/SRR27013333\_1.fastq.gz -o SRR27013333\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/033/SRR27013333/SRR27013333\_2.fastq.gz -o SRR27013333\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/032/SRR27013332/SRR27013332\_1.fastq.gz -o SRR27013332\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/032/SRR27013332/SRR27013332\_2.fastq.gz -o SRR27013332\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/031/SRR27013331/SRR27013331\_1.fastq.gz -o SRR27013331\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/031/SRR27013331/SRR27013331\_2.fastq.gz -o SRR27013331\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/030/SRR27013330/SRR27013330\_1.fastq.gz -o SRR27013330\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/030/SRR27013330/SRR27013330\_2.fastq.gz -o SRR27013330\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/029/SRR27013329/SRR27013329\_1.fastq.gz -o SRR27013329\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/029/SRR27013329/SRR27013329\_2.fastq.gz -o SRR27013329\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/028/SRR27013328/SRR27013328\_1.fastq.gz -o SRR27013328\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/028/SRR27013328/SRR27013328\_2.fastq.gz -o SRR27013328\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/027/SRR27013327/SRR27013327\_1.fastq.gz -o SRR27013327\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/027/SRR27013327/SRR27013327\_2.fastq.gz -o SRR27013327\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/026/SRR27013326/SRR27013326\_1.fastq.gz -o SRR27013326\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/026/SRR27013326/SRR27013326\_2.fastq.gz -o SRR27013326\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/025/SRR27013325/SRR27013325\_1.fastq.gz -o SRR27013325\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/025/SRR27013325/SRR27013325\_2.fastq.gz -o SRR27013325\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/023/SRR27013323/SRR27013323\_1.fastq.gz -o SRR27013323\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/023/SRR27013323/SRR27013323\_2.fastq.gz -o SRR27013323\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/024/SRR27013324/SRR27013324\_1.fastq.gz -o SRR27013324\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/024/SRR27013324/SRR27013324\_2.fastq.gz -o SRR27013324\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/022/SRR27013322/SRR27013322\_1.fastq.gz -o SRR27013322\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/022/SRR27013322/SRR27013322\_2.fastq.gz -o SRR27013322\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/021/SRR27013321/SRR27013321\_1.fastq.gz -o SRR27013321\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/021/SRR27013321/SRR27013321\_2.fastq.gz -o SRR27013321\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/020/SRR27013320/SRR27013320\_1.fastq.gz -o SRR27013320\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/020/SRR27013320/SRR27013320\_2.fastq.gz -o SRR27013320\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/019/SRR27013319/SRR27013319\_1.fastq.gz -o SRR27013319\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/019/SRR27013319/SRR27013319\_2.fastq.gz -o SRR27013319\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/018/SRR27013318/SRR27013318\_1.fastq.gz -o SRR27013318\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/018/SRR27013318/SRR27013318\_2.fastq.gz -o SRR27013318\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/009/SRR27013309/SRR27013309\_1.fastq.gz -o SRR27013309\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/009/SRR27013309/SRR27013309\_2.fastq.gz -o SRR27013309\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/010/SRR27013310/SRR27013310\_1.fastq.gz -o SRR27013310\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/010/SRR27013310/SRR27013310\_2.fastq.gz -o SRR27013310\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/017/SRR27013317/SRR27013317\_1.fastq.gz -o SRR27013317\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/017/SRR27013317/SRR27013317\_2.fastq.gz -o SRR27013317\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/008/SRR27013308/SRR27013308\_1.fastq.gz -o SRR27013308\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/008/SRR27013308/SRR27013308\_2.fastq.gz -o SRR27013308\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/007/SRR27013307/SRR27013307\_1.fastq.gz -o SRR27013307\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/007/SRR27013307/SRR27013307\_2.fastq.gz -o SRR27013307\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/005/SRR27013305/SRR27013305\_1.fastq.gz -o SRR27013305\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/005/SRR27013305/SRR27013305\_2.fastq.gz -o SRR27013305\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/003/SRR27013303/SRR27013303\_1.fastq.gz -o SRR27013303\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/003/SRR27013303/SRR27013303\_2.fastq.gz -o SRR27013303\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/006/SRR27013306/SRR27013306\_1.fastq.gz -o SRR27013306\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/006/SRR27013306/SRR27013306\_2.fastq.gz -o SRR27013306\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/004/SRR27013304/SRR27013304\_1.fastq.gz -o SRR27013304\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/004/SRR27013304/SRR27013304\_2.fastq.gz -o SRR27013304\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/002/SRR27013302/SRR27013302\_1.fastq.gz -o SRR27013302\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/002/SRR27013302/SRR27013302\_2.fastq.gz -o SRR27013302\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/001/SRR27013301/SRR27013301\_1.fastq.gz -o SRR27013301\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/001/SRR27013301/SRR27013301\_2.fastq.gz -o SRR27013301\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/000/SRR27013300/SRR27013300\_1.fastq.gz -o SRR27013300\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/000/SRR27013300/SRR27013300\_2.fastq.gz -o SRR27013300\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/097/SRR27013297/SRR27013297\_1.fastq.gz -o SRR27013297\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/097/SRR27013297/SRR27013297\_2.fastq.gz -o SRR27013297\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/098/SRR27013298/SRR27013298\_1.fastq.gz -o SRR27013298\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/098/SRR27013298/SRR27013298\_2.fastq.gz -o SRR27013298\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/099/SRR27013299/SRR27013299\_1.fastq.gz -o SRR27013299\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/099/SRR27013299/SRR27013299\_2.fastq.gz -o SRR27013299\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/096/SRR27013296/SRR27013296\_1.fastq.gz -o SRR27013296\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/096/SRR27013296/SRR27013296\_2.fastq.gz -o SRR27013296\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/095/SRR27013295/SRR27013295\_1.fastq.gz -o SRR27013295\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/095/SRR27013295/SRR27013295\_2.fastq.gz -o SRR27013295\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/094/SRR27013294/SRR27013294\_1.fastq.gz -o SRR27013294\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_1.fastq.gz

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR270/094/SRR27013294/SRR27013294\_2.fastq.gz -o SRR27013294\_Genome\_Sequencing\_of\_Listeria\_monocytogenes\_SA\_outbreak\_2017\_2.fastq.gz







3.2 Quality Control and Preprocessing 



Tools used: FastQC and Fastp



Purpose: Assessed base quality, trimmed adapters, corrected sequencing errors.



\#!/bin/bash

\# ======================================================

\# Quality Control with FastQC

\# ======================================================



\# Input/output directories

RAW\_DIR="raw\_reads"

OUT\_DIR="fastqc\_report"



echo "=== FASTQC STEP STARTED ==="



\# 1. Check if input folder exists

if \[ ! -d "$RAW\_DIR" ]; then

&nbsp;   echo "ERROR: Input folder '$RAW\_DIR' not found!"

&nbsp;   exit 1

fi



\# 2. Create output folder if it doesn’t exist

mkdir -p "$OUT\_DIR"

echo "Output directory set to: $OUT\_DIR"



\# 3. Find all FASTQ files

FASTQ\_FILES=($RAW\_DIR/\*.fastq.gz)



if \[ ${#FASTQ\_FILES\[@]} -eq 0 ]; then

&nbsp;   echo "ERROR: No FASTQ files found in '$RAW\_DIR'"

&nbsp;   exit 1

fi



\# 4. Run FastQC

echo "Running FastQC on ${#FASTQ\_FILES\[@]} files..."

fastqc -t 8 "${FASTQ\_FILES\[@]}" -o "$OUT\_DIR"



\# 5. Check exit code

if \[ $? -eq 0 ]; then

&nbsp;   echo "✓ FastQC completed successfully."

&nbsp;   echo "Reports saved in: $OUT\_DIR"

else

&nbsp;   echo "✗ FastQC encountered an error. Check logs."

&nbsp;   exit 1

fi



echo "=== FASTQC STEP COMPLETED ==="



\# ======================================================

\#Preprocessing with FastP

\# ======================================================



!/bin/bash



\# Create output directory for trimmed reads

mkdir -p trimmed\_reads



echo "=== Starting read trimming with fastp ==="



\# Loop through all R1 files in raw\_reads

for r1 in raw\_reads/\*\_1.fastq.gz; do

&nbsp;   # Extract the base sample name (everything before \_1.fastq.gz)

&nbsp;   base=$(basename "$r1" \_1.fastq.gz)

&nbsp;   r2="raw\_reads/${base}\_2.fastq.gz"



&nbsp;   echo "Processing sample: $base"



&nbsp;   # Check if R2 file exists before running fastp

&nbsp;   if \[\[ ! -f "$r2" ]]; then

&nbsp;       echo "Skipping $base: Missing pair file ($r2 not found)"

&nbsp;       continue

&nbsp;   fi



&nbsp;   # Run fastp

&nbsp;   fastp \\

&nbsp;       -i "$r1" \\

&nbsp;       -I "$r2" \\

&nbsp;       -o "trimmed\_reads/${base}\_1\_trimmed.fastq.gz" \\

&nbsp;       -O "trimmed\_reads/${base}\_2\_trimmed.fastq.gz" \\

&nbsp;       --html "trimmed\_reads/${base}\_fastp\_report.html" \\

&nbsp;       --thread 4



&nbsp;   # Check if fastp ran successfully

&nbsp;   if \[\[ $? -ne 0 ]]; then

&nbsp;       echo " Error trimming sample $base"

&nbsp;else

&nbsp;       echo "Finished trimming sample $base"

&nbsp;   fi

done



echo "=== All samples processed with fastp ==="



3.3 Genome Assembly



Tool: SPAdes (de novo assembly with k=33,55, phred offset 33)



Output: Contigs per isolate



\#!/bin/bash



\# ==============================

\# Genome assembly with SPAdes

\# ==============================



\# Create output directory if it doesn't exist

mkdir -p assembly2



echo "=== Starting genome assembly with SPAdes ==="



\# Loop through all R1 trimmed reads

for r1 in trimmed\_reads/\*\_1\_trimmed.fastq.gz; do

&nbsp;   # Find the matching R2 file

&nbsp;   r2="${r1/\_1\_trimmed.fastq.gz/\_2\_trimmed.fastq.gz}"

&nbsp;   

&nbsp;   # Extract sample name from file (everything before \_1\_trimmed.fastq.gz)

&nbsp;   sample=$(basename "$r1" \_1\_trimmed.fastq.gz)



&nbsp;   echo "--------------------------------------------"

&nbsp;   echo "Processing sample: $sample"

&nbsp;   echo "R1: $r1"

&nbsp;   echo "R2: $r2"



&nbsp;   # Check if R2 exists

&nbsp;   if \[\[ ! -f "$r2" ]]; then

&nbsp;       echo "Skipping $sample: Missing pair file ($r2 not found)"

&nbsp;       continue

&nbsp;   fi



&nbsp;   # Run SPAdes with phred 33 (Illumina default), k-mer sizes 33 and 55

&nbsp; spades.py \\

&nbsp;       -1 "$r1" \\

&nbsp;       --phred-offset 33 \\

&nbsp;       -o "assembly2/$sample"



&nbsp;   # Check exit status of SPAdes

&nbsp;   if \[\[ $? -ne 0 ]]; then

&nbsp;       echo " Error: SPAdes failed for $sample"

&nbsp;   else

&nbsp;       echo " Assembly completed for $sample"

&nbsp;       echo "Output directory: assembly2/$sample"

&nbsp;   fi

done



echo "=== All assemblies finished ==="



3.4 Assembly Assessment



Tool: QUAST



Metrics generated: N50, L50, GC content, total genome length (~2.9–3.1 Mbp, typical of L. monocytogenes).



!/bin/bash



\# ==============================

\# Assembly quality check with QUAST

\# ==============================



\# Create a folder to store all QUAST reports

mkdir -p quast\_report



echo "=== Starting QUAST analysis for assembled genomes ==="



\# Loop through each assembly directory

for dir in assembly2/\*; do

&nbsp;   # Extract sample name from folder name

&nbsp;   sample=$(basename "$dir")



&nbsp;   echo "--------------------------------------------"

&nbsp;   echo "Processing sample: $sample"

&nbsp;   echo "Assembly directory: $dir"



&nbsp;   # Check if contigs.fasta exists

&nbsp;   if \[\[ ! -f "$dir/contigs.fasta" ]]; then

&nbsp;       echo "Skipping $sample: contigs.fasta not found"

&nbsp;       continue

&nbsp;   fi



&nbsp;   # Run QUAST on the contigs

&nbsp;   quast.py "$dir/contigs.fasta" -o "quast\_report/${sample}" --threads 4



&nbsp;   # Check if QUAST succeeded

&nbsp;   if \[\[ $? -ne 0 ]]; then

&nbsp;       echo " Error: QUAST failed for $sample"

&nbsp;   else

echo " QUAST completed for $sample"

&nbsp;       echo "Report saved in: quast\_report/${sample}/report.html"

&nbsp;   fi

done



echo "=== All QUAST analyses finished ==="





3.5 Pathogen Confirmation



\# ==============================

\# Organism identification with BLAST

\# ==============================



Approach: Representative contig BLAST against NCBI nt database



\#!/bin/bash



ASSEMBLY\_PATHS=("assembly2" "assembly\_fixed")

BLAST\_OUT="blast\_check"

mkdir -p "$BLAST\_OUT"



echo ">>> Running BLAST organism identification on all assemblies..."



\# Loop through all contigs.fasta files

for contigs in $(find "${ASSEMBLY\_PATHS\[@]}" -type f -name "contigs.fasta"); do

&nbsp;   sample=$(basename "$(dirname "$contigs")")

&nbsp;   query="$BLAST\_OUT/${sample}\_query.fasta"

&nbsp;   out="$BLAST\_OUT/${sample}\_blast.tsv"



&nbsp;   echo ">>> Processing sample: $sample"



&nbsp;   # Extract the first 200 lines (to avoid huge BLAST jobs)

&nbsp;   head -n 200 "$contigs" > "$query"



&nbsp;   # Run BLAST

&nbsp;   blastn -query "$query" -db nt -remote \\

&nbsp;          -outfmt "6 std stitle" \\

&nbsp;          -max\_target\_seqs 5 \\

&nbsp;          -evalue 1e-40 \\

&nbsp;          -out "$out"



&nbsp;   if \[\[ -s "$out" ]]; then

&nbsp;       echo "✓ BLAST complete for $sample"

&nbsp;       echo "Top hit:"

&nbsp;       head -1 "$out"

&nbsp;   else

&nbsp;       echo "✗ BLAST failed for $sample"

&nbsp;   fi

done



echo ">>> All BLAST jobs finished."



3.6  Antimicrobial Resistance Detection and Toxin screening



\# ==============================

\# AMR gene detection with ABRicate

\# ==============================



Tool: ABRicate (CARD database) and (VFDB database)





\#!/bin/bash



ABRICATE\_DIR="AMR"



\# Create subfolders for results

mkdir -p "$ABRICATE\_DIR/amr" "$ABRICATE\_DIR/toxin" "$ABRICATE\_DIR/summary"



\# Loop over both assembly directories

for ASSEMBLY\_DIR in assembly2 assembly\_fixed; do

&nbsp;   echo "=== Processing directory: $ASSEMBLY\_DIR ==="



&nbsp;   for assembly\_dir in "$ASSEMBLY\_DIR"/\*; do

&nbsp;       sample=$(basename "$assembly\_dir")

&nbsp;       contigs="$assembly\_dir/contigs.fasta"



&nbsp;       if \[\[ -s "$contigs" ]]; then

&nbsp;           echo "  Running ABRicate for $sample..."



&nbsp;           # AMR (CARD)

&nbsp;           abricate --db card "$contigs" > "$ABRICATE\_DIR/amr/${sample}\_amr.tsv"



&nbsp;           # Virulence (VFDB)

&nbsp;           abricate --db vfdb "$contigs" > "$ABRICATE\_DIR/toxin/${sample}\_toxin.tsv"

&nbsp;       else

&nbsp;           echo "  Skipping $sample (no contigs.fasta)"

&nbsp;       fi

&nbsp;   done

done



\# Summaries

echo "=== Generating summaries ==="

abricate --summary "$ABRICATE\_DIR/amr"/\*.tsv > "$ABRICATE\_DIR/summary/amr\_summary.tsv"

abricate --summary "$ABRICATE\_DIR/toxin"/\*.tsv > "$ABRICATE\_DIR/summary/toxin\_summary.tsv"



echo "✓ Done. Results are in $ABRICATE\_DIR/"



4\. Results



4.1  Organism Identification



BLAST analysis showed almost 100 percent similarity with the pathogen Listeria monocytogenes.



Contig					Subject accesion		Percentage 	identity Organism

NODE\_1\_length\_186027\_cov\_81.345945		CP196566.1		100		Listeria monocytogenes strain BL91/023 

NODE\_1\_length\_186027\_cov\_81.345945		CP110922.1		100		Listeria monocytogenes strain 11-04869 

NODE\_1\_length\_186027\_cov\_81.345945		CP111150.1		100		Listeria monocytogenes strain 19-02390 

NODE\_1\_length\_186027\_cov\_81.345945		CP115044.1		100		Listeria monocytogenes strain MKELm224\_2022

NODE\_1\_length\_186027\_cov\_81.345945		CP075871.1		100		Listeria monocytogenes strain 3BS29 chromosome



4.2  AMR Genes Identification 



1\.  fosX 

The fosX gene directly confers resistance to fosfomycin, an antibiotic that can be used to treat gram-positive bacterial infections. 

fosX gene was present in 100% of the L. innocua isolates examined in South Africa. 

The fosX gene provides intrinsic fosfomycin resistance in Listeria species, including L. innocua and L. monocytogenes. 



2\. mprF

The mprF gene is known to be involved in the production of lysylphosphatidylglycerol (LPG), which is a key component of the bacterial cell membrane. 

In S. aureus, the mprF gene is associated with resistance to daptomycin (DAP), an important antibiotic used to treat severe infections. 



3\. lin

The lin gene confers resistance to fosfomycin, a widely used antibiotic in livestock, particularly in South Africa

A 2023 study in the Gauteng province, South Africa, found the lin gene to be highly prevalent in Listeria innocua isolates from beef products.

100% prevalence was detected in L. innocua isolates from retail outlets.



4.norB

Specific substrates for the NorB pump include fluoroquinolones like levofloxacin and moxifloxacin. 

Overexpression of the norB gene leads to the increased activity of its encoded efflux pump. 

This increased pump activity helps bacteria extrude drugs and other toxic substances from the cell, preventing them from reaching their intracellular targets. 



4.3  Toxin genes



actA , bsh , clpC , clpE , clpP , fbpA , gtcA , hly , hpt , iap/cwhA , inlA , inlB , inlC , inlF , inlJ , inlK , lap , lapB , llsA , llsB , llsD , llsG , llsH , llsP , llsX , llsY , lntA , lpeA , lplA1 , lspA , mpl , oatA ,  pdgA , plcA ,	plcB ,	prfA ,	prsA2 ,	vip



5\. Public Health Implications



* Food Safety is Paramount: The outbreak underscored the importance of stringent food safety regulations and practices in the processed meat industry. 
* Surveillance and Monitoring: Effective food safety surveillance is crucial for detecting and responding to outbreaks quickly. 
* Consumer Awareness: Educating consumers on food safety, particularly regarding ready-to-eat products like polony, is vital for reducing risks. 
* Need for Stronger Enforcement: The outbreak highlighted the need for stronger enforcement of food safety laws and increased capacity of food safety inspectors in South Africa. 





















