#download top hit of each transcript ONLY for BLAST search as .csv files
#navigate to directory containing csv files
#use: bash blasttophits.sh
for i in *Alignment*
do
cat "$i >> tophits.csv
done

