#!/bin/bash
#use: creates new columns for the first (mouse type), second (transcript type), and third (number hits) rows of each set. Then names specific to HMMsearchHits.txt are shortened.
awk '{printf "%s%s",$0,NR%3?",":RS}' HMMsearchHits.txt | sed -e s/protein.fasta//g | sed -e s/_Proteins.fasta.aligned.hmm//g > hitTableFinal.csv
