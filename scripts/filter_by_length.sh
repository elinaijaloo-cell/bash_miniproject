#!/usr/bin/bash
cd ../Data/

minimum=$1
#creating a list of sequence length

list=$(grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f4)

#creating a for loop

for length in $list; do
	
	if [ "$length" -ge "$minimum" ]; then
		grep "length_$length" IP-004_S38_L001_scaffolds.fasta >> ../results/filtered_sequences.txt
	fi
done
count=$(cat ../results/filtered_sequences.txt | wc -l)

echo "Found $count sequences with length >= 5000 bases" #getting sequences with bases >= 5000
