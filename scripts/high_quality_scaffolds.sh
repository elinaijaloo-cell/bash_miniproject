#!/usr/bin/bash

cd ../Data/

minimum_length=10000
minimum_coverage=5.0

list=$(grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f4)

for length in $list; do     #doing a for loop
        if [ "$length" -ge "$minimum_length" ]; then
		coverage=$(grep "length_$length" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f6)
		if [ -n "$coverage" ] && [ $(echo "$coverage >= $minimum_coverage" | bc -l) -eq 1 ]; then 
			grep "length_$length" IP-004_S38_L001_scaffolds.fasta >> ../results/high_quality_scaffolds.txt 
		fi
        fi
done

Seq_count=$(cat ../results/high_quality_scaffolds.txt | wc -l) #count sequences with HQS

echo "Found $Seq_count sequences high quality scaffolds" # printing sequences with high quality scaffolds from seq_count
