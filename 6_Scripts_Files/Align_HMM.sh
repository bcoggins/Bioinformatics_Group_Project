###Usage: bash Align_HMM.sh

###Output: Aligned fasta files with name file.aligned, HMM files with file.hmm, HMMsearch files with file.txt and search hit table HMMsearchHits.txt

###Run after secure copy (scp) files from local to remote. Input files should be in same directory as bash script

#!/bin/bash 

#Make muscle alignment for fasta files
for sequence in Transcript*_Proteins.fasta
do
../../local/bin/muscle3.8.31_i86linux64 -in $sequence -out $sequence.aligned
echo Sequence Aligned
done
#Output: Aligned fasta files with added extension .aligned

#Make HMM protein models for aligned sequences
for aligned in Transcript*_Proteins.fasta.aligned
do
../../local/bin/hmmbuild $aligned.hmm $aligned
echo HMM built
done
#Output: HMM files with added extension .hmm

#Search other fasta files for each HMM
for RNAseq in *protein.fasta
do
	for HMM in Transcript*_Proteins.fasta.aligned.hmm
	do
	echo $RNAseq >> HMMsearchHits.txt
	echo $HMM >> HMMsearchHits.txt
	../../local/bin/hmmsearch --tblout $HMM.txt $HMM $RNAseq
	grep -v "#" $HMM.txt | wc -l >> HMMsearchHits.txt
	echo RNAseq files searched for HMMs
	done
done
#Output: Search result files for every HMM file with added extension.txt and table of search hits HMMsearchHits.txt

