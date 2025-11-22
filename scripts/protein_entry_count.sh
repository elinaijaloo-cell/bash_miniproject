#!/usr/bin/bash

cd ../Data

#counting the number of protein entries
entrycount=$(cat humchrx.txt  | cut -d' ' -f1 | tail -898 | head -890 | wc -l)

echo "There are $entrycount protein entries" > ../results/protein_entry_count.txt
