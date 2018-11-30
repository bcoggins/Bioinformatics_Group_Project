###Usage: bash Align_HMM.sh
###run after scp to remote: scp transcript*.fasta, scp *protein.fasta

#Psuedocode:
#run as bash Align_HMM.sh transcript*.fasta *protein.fasta (?)
#then use as command $1 $2 

#Make muscle alignment for 6 transcripts
#/afs/nd.edu/user17/saraki/local/bin/muscle3.8.31_i86linux64 -in transcript[1-6].fasta -out transcript_aligned[1-6].fasta

#Make HMM protein models for 6 transcripts
#hmmbuild transcript[1-6].hmm transcript_aligned[1-6].fasta

#Search 4 RNAseq files for each of 6 HMMs
for file in *protein.fasta
do
echo $file >> matches.txt
hmmsearch --tblout transcript[1-6].hits transcript[1-6].hmm $file
grep -v "#" transcript[1-6].hits | wc -l >> matches.txt
echo matches.txt created
done


