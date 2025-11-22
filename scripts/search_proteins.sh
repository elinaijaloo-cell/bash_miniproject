#!/usr/bin/bash

cd ../Data/

search_term=$1

cat humchrx.txt | grep -i "$search_term" | cut  -c33-45,63- > ../results/protein_search_results.txt  

entry_count=$(cat humchrx.txt | grep -i "$search_term" | cut  -c33-45,63-  | wc -l)   #protein entries counting

echo "There are $entry_count hits"   #print  number of counts

