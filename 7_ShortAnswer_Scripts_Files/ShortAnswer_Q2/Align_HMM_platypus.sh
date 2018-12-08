###Usage: bash Align_HMM_platypus.sh 

###Output: Aligned fasta files with name file.aligned, HMM files with file.hmm, HMMsearch files with file.txt and search hit table HMMsearchHits.txt

###Run after securely copying (scp) files from local to remote. Input files should be in same directory as bash script. 

#!/bin/bash

#Make muscle alignment for fasta files
for sequence in platypus*.fasta
do
../../local/bin/muscle3.8.31_i86linux64 -in $sequence -out $sequence.aligned
echo Sequence Aligned
done
#Output: Aligned fasta files with added extension .aligned 

#Make HMM protein models for 6 transcripts
for aligned in platypus*.fasta.aligned
do
../../local/bin/hmmbuild $aligned.hmm $aligned
echo HMM built
done
#Output: HMM files with added extension .hmm 

#Search other fasta files for each HMM
for fasta in *protein.fasta
do
	for HMM in platypus*.fasta.aligned.hmm
	do
	echo $fasta >> HMMsearchHits2.txt
	echo $HMM >> HMMsearchHits2.txt
	../../local/bin/hmmsearch --tblout $HMM.txt $HMM $fasta
	grep -v "#" $HMM.txt | wc -l >> HMMsearchHits2.txt
	echo Fasta files searched for HMMs
	done
done
#Output: Search files for every HMM file with added extension .txt and table of search hits HMMsearchHits.txt


