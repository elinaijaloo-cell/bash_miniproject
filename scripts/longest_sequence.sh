#!/usr/bin/bash
cd ../Data/

longest_s=$(grep "length" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f4 | sort -n | tail -1)
node=$(grep "length_$longest_s" IP-004_S38_L001_scaffolds.fasta | cut -d'>' -f2| cut -d'_' -f1,2)
coverage=$(grep "length_$longest_s" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f6)

echo "longestsequence: $node" > ../results/longest_sequence.txt
echo "length: $longest_s" >> ../results/longest_sequence.txt
echo "coverage: $coverage" >> ../results/longest_sequence.txt
