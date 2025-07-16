#!/bin/bash
source activate hicpro

samples=(ReN-CTCF-ChIP_L1 \
ReN-H3K4me3-ChIP_L1 \
ReN-input_L1)
#genome_index="/run/media/guoya/disk2/hic/calJac3"
genome_index=" /home/guoya/HiC-Pro/hg19/hg19"

#bowtie2 -x /home/guoya/HiC-Pro/hg19/hg19 -q -1 100PE_%s_L6_1.fq -2 100PE_%s_L6_2.fq -S %s.sam
#samtools view -b -S %s.sam > %s.bam
#samtools view -b -h -F 4 %s.bam > %s_mapped.bam
#samtools sort %s_mapped.bam -o %s_mapped_sorted.bam
#java -jar /home/guoya/java/picard.jar MarkDuplicates I=/run/media/guoya/diska/GL20_ChIPseq/231209-E00517A_L006/%s_mapped_sorted.bam O=/run/media/guoya/diska/GL20_ChIPseq/231209-E00517A_L006/%s_mapped_sorted_RemoveDuplicates.bam M=/run/media/guoya/diska/GL20_ChIPseq/231209-E00517A_L006/%s_marked_dup_metrics.txt REMOVE_DUPLICATES=true
#macs2 callpeak -t %s_mapped_sorted_RemoveDuplicates.bam -n %s -B --SPMR --call-summits -q 0.05;
#rm %s_mapped.bam
#rm %s.bam
#gzip 100PE_%s_L6_*.fq
for sample in ${samples[@]}
do
	#bowtie2 -x $genome_index -q -1 ${sample}_1.fq  -2 ${sample}_2.fq  -S ${sample}.sam
	#samtools view -b -S ${sample}.sam   >  ${sample}.bam
	#samtools view -b -h -F 4 ${sample}.bam > ${sample}_mapped.bam
	#samtools sort ${sample}_mapped.bam -o ${sample}_mapped_sorted.bam
	#java -jar /home/guoya/java/picard.jar MarkDuplicates I=./${sample}_mapped_sorted.bam O=./${sample}_marked_dup.bam M=./${sample}_marked_dup_metrics.txt REMOVE_DUPLICATES=true
	samtools index ${sample}_marked_dup.bam
	#samtools view -h  <inBAM>  |  removeChrom - - chrM  |  samtools view -b -  >  <outBAM>
	#samtools view -b  -q 10  ${sample}_marked_dup.bam  >  ${sample}_marked_dup_specificity.bam
	#macs2 callpeak  -t ${sample}_marked_dup_specificity.bam  -f BAM  -n ${sample} -B -g mm  --keep-dup all
	#macs2 callpeak  -t ${sample}_marked_dup_specificity.bam -n ${sample} -B --SPMR --call-summits -q 0.05;
	#rm ${sample}_1.fastq.gz
	#rm ${sample}_2.fastq.gz
	#rm ${sample}_marked_dup.bam
	#rm ${sample}_marked_dup_metrics.txt

done
##macs2 callpeak -t ReN-CTCF-ChIP_L1_marked_dup.bam -c ReN-input_L1_marked_dup.bam -n CTCF -B --SPMR --call-summits -q 0.05;
##macs2 callpeak -t ReN-H3K4me3-ChIP_L1_marked_dup.bam -c ReN-input_L1_marked_dup.bam -n H3K4me3 -B --SPMR --call-summits -q 0.05;
21840865 reads; of these:
  21840865 (100.00%) were paired; of these:
    9333451 (42.73%) aligned concordantly 0 times
    10576750 (48.43%) aligned concordantly exactly 1 time
    1930664 (8.84%) aligned concordantly >1 times
    ----
    9333451 pairs aligned concordantly 0 times; of these:
      4047541 (43.37%) aligned discordantly 1 time
    ----
    5285910 pairs aligned 0 times concordantly or discordantly; of these:
      10571820 mates make up the pairs; of these:
        7624514 (72.12%) aligned 0 times
        1394945 (13.19%) aligned exactly 1 time
        1552361 (14.68%) aligned >1 times
82.55% overall alignment rate
24444468 reads; of these:
  24444468 (100.00%) were paired; of these:
    11266357 (46.09%) aligned concordantly 0 times
    11039480 (45.16%) aligned concordantly exactly 1 time
    2138631 (8.75%) aligned concordantly >1 times
    ----
    11266357 pairs aligned concordantly 0 times; of these:
      4489776 (39.85%) aligned discordantly 1 time
    ----
    6776581 pairs aligned 0 times concordantly or discordantly; of these:
      13553162 mates make up the pairs; of these:
        9847888 (72.66%) aligned 0 times
        1752403 (12.93%) aligned exactly 1 time
        1952871 (14.41%) aligned >1 times
79.86% overall alignment rate
19082433 reads; of these:
  19082433 (100.00%) were paired; of these:
    10158574 (53.24%) aligned concordantly 0 times
    7612695 (39.89%) aligned concordantly exactly 1 time
    1311164 (6.87%) aligned concordantly >1 times
    ----
    10158574 pairs aligned concordantly 0 times; of these:
      3583656 (35.28%) aligned discordantly 1 time
    ----
    6574918 pairs aligned 0 times concordantly or discordantly; of these:
      13149836 mates make up the pairs; of these:
        11245362 (85.52%) aligned 0 times
        805203 (6.12%) aligned exactly 1 time
        1099271 (8.36%) aligned >1 times
70.53% overall alignment rate

