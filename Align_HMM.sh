###Usage: bash Align_HMM.sh
###run after scp to remote: scp transcript*.fasta, scp *protein.fasta

#Make muscle alignment for 6 transcripts
for sequence in Transcript*_Proteins.fasta
do
../../local/bin/muscle3.8.31_i86linux64 -in $sequence -out $sequence.aligned
echo Aligned
done

#Make HMM protein models for 6 transcripts
for aligned in Transcript*_Proteins.fasta.aligned
do
../../local/bin/hmmbuild $aligned.hmm $aligned
echo HMM built
done

#Search 4 RNAseq files for each of 6 HMMs
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


