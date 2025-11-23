# Bash Mini-Project: Genomic Data Analysis

## Student Information
**Name**: Haundjodjo Ndepalela Elina
**Student ID**: MB300-0006/2024
**Course**: PUB 3127 - Computing for Biologists
**Date Started**: 22 November 2025
**Date Completed**: 23 November 2025

---

## Project Description
This project analyzes genomic scaffold data and protein database records using bash command-line tools. The analysis includes:
- Counting and filtering DNA sequences from FASTA files
- Identifying high-quality scaffolds based on length and coverage criteria
- Extracting and analyzing protein information from database files
- Automating bioinformatics workflows with bash scripts

---

## Repository Contents

```
bash_miniproject/
├── ASSIGNMENT.md
├── Data
│   ├── IP-004_S38_L001_scaffolds.fasta
│   └── humchrx.txt
├── README.md
├── results
│   ├── analysis_summary.txt
│   ├── filtered_sequences.txt
│   ├── genenames_sorted.txt
│   ├── high_quality_scaffolds.txt
│   ├── longest_sequence.txt
│   ├── protein_entry_count.txt
│   ├── protein_search_results.txt
│   └── sequence_ids.txt
└── scripts
    ├── extract_genes.sh
    ├── extract_headers.sh
    ├── filter_by_length.sh
    ├── high_quality_scaffolds.sh
    ├── longest_sequence.sh
    ├── protein_entry_count.sh
    ├── run_analysis.sh
    └── search_proteins.sh

4 directories, 20 files                     
```

---

## Requirements

### Software
- Bash shell (Linux, macOS, or WSL on Windows)
- Git and GitHub account
- Basic Unix tools: `grep`, `cut`, `sort`, `uniq`, `wc`, `head`, `tail`
- Text editor (nano, vim, VS Code, etc.)

### Data Files
The `Data/` directory contains:
1. **IP-004_S38_L001_scaffolds.fasta** (~10 MB) - Genomic scaffolds from sequencing assembly
2. **humchrx.txt** (~152 KB) - UniProt protein entries for human chromosome X

---

## Usage Instructions

### Setup
1. Clone this repository:
   ```bash
   git clone [YOUR_REPO_URL]
   cd bash_miniproject
   ```

2. Verify data files are present:
   ```bash
   ls -lh Data/
   ```

### Running the Scripts


#### Script 1: Extract Headers
```bash
./scripts/extract_headers.sh
```
**Purpose**: Extracts all sequence headers from the FASTA file
**Output**: `results/sequence_ids.txt` - List of NODE identifiers

#### Script 2: Find Longest Sequence
```bash
./scripts/longest_sequence.sh
```
**Purpose**: Identifies the scaffold with the longest sequence
**Output**: `results/longest_sequence.txt` - Details of the longest scaffold

#### Script 3: Filter by Length
```bash
./scripts/filter_by_length.sh 5000
```
**Purpose**: Filters scaffolds with length >= specified minimum
**Output**: `results/filtered_sequences.txt` - Filtered scaffold headers

#### Script 4: High-Quality Scaffolds
```bash
./scripts/high_quality_scaffolds.sh
```
**Purpose**: Identifies scaffolds meeting both length and coverage criteria
**Output**: `results/high_quality_scaffolds.txt` - High-quality scaffold list

#### Script 5: Extract Gene Names
```bash
./scripts/extract_genes.sh
```
**Purpose**: Extracts unique gene names from protein database
**Output**: `results/gene_names_sorted.txt` - Sorted unique gene names

#### Script 6: Search Proteins
```bash
./scripts/search_proteins.sh "kinase"
```
**Purpose**: Searches for proteins matching a keyword
**Output**: `results/protein_search_results.txt` - Matching protein entries


### Running the Master Script
```bash
./scripts/run_analysis.sh ./Data/
```
**Purpose**: Runs all analyses in sequence and generates a comprehensive summary
**Output**:
- All result files from individual scripts
- `results/analysis_summary.txt` - Summary of all analyses with counts and timestamp


---

## Analysis Results Summary



### FASTA File Analysis
- **Total number of sequences**: 35079
- **Longest sequence**: NODE_1
- **Number of sequences with length >= 5000**: There are about 283 sequences with length >= 5000
- **Number of high-quality scaffolds** (length >= 10000, coverage >= 5.0): The number of high quality scaffolds among the sequences is 33

### Protein Database Analysis
- **Total protein entries**: There are 890 protein entries
- **Number of unique genes**: There are about 888 unique genes
- **Example protein search result** (e.g., for "kinase"):There are 36 kinase for example Q86UN6     AKA-kinase anchor protein 14 (AKAP-14) (A-kinase anchor protein 28 kDa) (AKAP 28) (Protein kinase A-anchoring protein 14) (PRKA14) [AKAP28]
Q02040     AKA-kinase anchor protein 17A (AKAP-17A) (721P) (B-lymphocyte antigen) (Protein XE7) (Protein kinase A-anchoring protein 17A) (PRKA17A) (Splicing factor, arginine/serine-rich 17A) [CXYorf3] [DXYS155E] 

### Key Findings
[1. When scripting you have to be running your scripts every after addition so that you can track and ractify errors as if you write a lot of codes before running
 it will be difficult to track the errors.
2.Scrptings need someone to be focused and well rested as it is easy to make mistakes ]

---

## Scripts Description


| Script Name | Purpose | Key Commands Used |
|-------------|---------|-------------------|
| `extract_headers.sh` | Extract NODE identifiers from FASTA file | grep, cut |
| `longest_sequence.sh` | Find the scaffold with the longest sequence | grep, sort, head |
| `filter_by_length.sh` | Filter scaffolds by minimum length | grep, cut, [loops] |
| `high_quality_scaffolds.sh` | Identify high-quality scaffolds | grep, cut, [conditionals] |
| `extract_genes.sh` | Extract unique gene names from protein file | cut, sort, uniq |
| `search_proteins.sh` | Search for proteins by keyword | grep |
| `run_analysis.sh` | Master script that runs all analyses | [calls all other scripts] |

---

## Challenges and Solutions

[TODO: Document any challenges you faced and how you solved them. This shows your problem-solving process. Example:]

**Challenge 1**: When i was scripting my master scripts at the part where i was creating my summary analysis i mistakely added "(quotes) and run it
	 
**Solution**: I had to delete my results directory since i was having a created analysis_summary.txt and re run my correct script


---

## What I Learned


- cat humchrx.txt | grep -i "$search_term" | cut  -c33-45,63- > ../results/protein_search_results.txt
- Command line can be used in extracting just a part of a sequence for example the accession number when dealing with large data, making the process fast
- This project will really be helpful for my interest of incoperating Bioinformatics in to my research project 

---

## References

- [Introduction to Linux Lectures](https://github.com/amelgh/Introduction_To_Linux/tree/master/Lectures)
- Course materials: PUB 3127 - Computing for Biologists
- Bash manual: `man bash`
- FASTA format: [https://en.wikipedia.org/wiki/FASTA_format](https://en.wikipedia.org/wiki/FASTA_format)

---

## License
This project is for educational purposes as part of PUB 3127 coursework.

---

## Acknowledgments
- **Instructor**: Caleb Kibet
- **Institution**: Pan African University Institute of Basic Science and Technology
- Data sources: [Sequencing data and UniProt database]
