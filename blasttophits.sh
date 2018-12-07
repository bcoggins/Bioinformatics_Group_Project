#download hits of each transcript from BLAST search as .csv files
#navigate to directory containing csv files
#use: bash blasttophits.sh

for i in Transcript*_HitTable.csv
do
cat "$i | head -n 1 >> tophits.csv
done

