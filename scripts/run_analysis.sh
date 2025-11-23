#!/bin/bash
# PUB3127 Analysis Script
# Author: Elina N Haundjodjo
# The script  explores FASTA files, sequence filtering, and protein database analysis
# Data directory  is used as the command-line argument

# was the argument passed?
if [ $# -eq 0 ]; then
	echo "Error: No directory provided"
	echo "Syntax: ./analysis.sh /PATH/TO/DIRECTORY"
	exit 1
fi

# Accepts data directory as a command-line argument
# > run_analysis.sh /PATH/To/DATA  to run the script

Data_dir=$1

# was the directory passed by the argument?
if [ ! -d "$Data_dir" ]; then  #check if the directory exist
	echo "Error: Not a valid directory"
	exit 1
fi
# changing to the data directory
cd $Data_dir

# are the  required input files in the  Data_dir?
requiredfiles=("IP-004_S38_L001_scaffolds.fasta" "humchrx.txt") # creating the list of required file
missingfiles=() # an empty variable to store the missing file names

for file in "${requiredfiles[@]}"; do # checking if the files in the list provided are in the directory
	[ ! -f "$Data_dir/$file" ] && missingfiles+=("$ile") #if a certain file if missing , it's added to the missing list
done

if [ ${#missingfiles[@]} -gt 0 ]; then # checking if there are missing variable
	echo "Error: Missing file: ${missingfiles[*]}"
	exit 1
fi

#Creating the results directory in the same directory  with the data to send all the output
mkdir ../results
echo "results directory created..."

# FASTA exploration
# This section is extracting sequence headers,counting number of sequence and finding the longest sequence
# The output will be sent to the results directory

# Extracting sequence headers
# Counting the number of sequence
grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'>' -f2 | cut -d'_' -f1,2 > ../results/sequence_ids.txt
extracted_count=$(grep -c ">" IP-004_S38_L001_scaffolds.fasta)
echo "Extracted $extracted_count sequence identifiers"
echo "Extracting sequence identifiers from the FASTA file: DONE"

# finding the longest sequence from the FASTA file
longest_s=$(grep "length" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f4 | sort -n | tail -1)

node=$(grep "length_$longest_s" IP-004_S38_L001_scaffolds.fasta | cut -d'>' -f2| cut -d'_' -f1,2)
coverage=$(grep "length_$longest_s" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f6)

echo "longestsequence: $node" > ../results/longest_sequence.txt
echo "length: $longest_s" >> ../results/longest_sequence.txt
echo "coverage: $coverage" >> ../results/longest_sequence.txt
echo "Finding the longest sequence in the FASTA file: DONE"

#  Sequence filtering and statistics

# Filtering the sequences by length
echo "starting sequence filtering and statistics"
minimum=5000 #This is the variable that is holding the minimum base length
#creating a list of sequence length
list=$(grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f4)

#creating a for loop

for length in $list; do

        if [ "$length" -ge "$minimum" ]; then
                grep "length_$length" IP-004_S38_L001_scaffolds.fasta >> ../results/filtered_sequences.txt
        fi
done
echo "Filtering of sequences by minimum length of 5000: DONE"

# Counting the number of generated sequences
count=$(cat ../results/filtered_sequences.txt | wc -l)

echo "Found $count sequences with length >= 5000 bases" # getting sequences with bases >= 5000

# Selecting high quality scaffolds based on length and coverage
minimum_length=10000
minimum_coverage=5.0

list2=$(grep ">" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f4)

for length in $list2; do     #doing a for loop
        if [ "$length" -ge "$minimum_length" ]; then
                coverage=$(grep "length_$length" IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f6)
                if [ -n "$coverage" ] && [ $(echo "$coverage >= $minimum_coverage" | bc -l) -eq 1 ]; then
                        grep "length_$length" IP-004_S38_L001_scaffolds.fasta >> ../results/high_quality_scaffolds.txt
                fi
        fi
done

Seq_count=$(cat ../results/high_quality_scaffolds.txt | wc -l) #count sequences with HQS

echo "Found $Seq_count sequences high quality scaffolds" # printing sequences with high quality scaffolds from seq_count
echo "Selecting high quality scaffold sequences based on length and coverage: DONE"

# Protein Database Analysis
# Protein entry count
entrycount=$(cat humchrx.txt  | cut -d' ' -f1 | tail -898 | head -890 | wc -l) # counting the number of protein entries

echo "There are $entrycount protein entries" > ../results/protein_entry_count.txt
echo "Counting protein entries from the database: DONE"

# Extracting genes from the database
cat humchrx.txt | cut -d' ' -f1 | tail -898 | head -890 | sort -u > ../results/genenames_sorted.txt  # extracting gene names and sorting them alphabetically
echo "Extracting genes from the database: DONE"

# Searching for specific proteins

search_term="kinase"
cat humchrx.txt | grep -i "$search_term" | cut  -c33-45,63- > ../results/protein_search_results.txt
echo "Searching for kinase proteins among the entries: DONE"
entry_count2=$(cat humchrx.txt | grep -i "$search_term" | cut  -c33-45,63-  | wc -l)   #protein entries counting

echo "There are $entry_count2 hits"   #print  number of counts

# Creating analysis summary
# The summary for total sequences in FASTA file
# Number of high quality scaffolds among the sequences
# Total protein entries
# Date and time the analysis was done

touch ../results/analysis_summary.txt
echo "The total number of sequences in the FASTA file is: $extracted_count" > ../results/analysis_summary.txt
echo "The number of of high quality scaffolds among the sequences is: $Seq_count" >> ../results/analysis_summary.txt
echo "The number of proteins in the database is: $entrycount" >> ../results/analysis_summary.txt
date  >> ../results/analysis_summary.txt

echo "DONE"
