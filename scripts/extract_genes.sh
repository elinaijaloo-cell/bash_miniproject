#!/usr/bin/bash

cd ../Data

#extracting gene names and sorting them alphabetically
cat humchrx.txt | cut -d' ' -f1 | tail -898 | head -890 | sort -u > ../results/genenames_sorted.txt
