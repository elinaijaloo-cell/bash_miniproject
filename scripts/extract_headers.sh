#!/usr/bin/bash

cd ../Data/
grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'>' -f2 | cut -d'_' -f1,2 > ../results/sequence_ids.txt
extracted_count=$(grep -c ">" IP-004_S38_L001_scaffolds.fasta)
echo "Extracted $extracted_count sequence identifiers" 
