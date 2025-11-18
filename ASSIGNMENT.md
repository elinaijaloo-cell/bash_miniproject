# Bash Mini-Project Assignment
## PUB 3127 - Computing for Biologists

### Assignment Overview
This mini-project will test your ability to use bash commands and Git/GitHub to analyze real biological sequence data. You will work with genomic scaffold data and protein database records to perform common bioinformatics tasks using the command line.

**Estimated Time**: 6-10 hours
**Due Date**: 26th November 2025
**Submission**: GitHub repository URL

---

## Learning Objectives
By completing this assignment, you will demonstrate your ability to:
- Fork a GitHub repository and clone it to your local machine
- Navigate the Linux file system and manipulate files using bash commands
- Process biological sequence data (FASTA format) using command-line tools
- Write bash scripts with loops, conditionals, and functions
- Use pipes and redirection to create data processing workflows
- Manage a Git repository with meaningful commits and push changes to GitHub
- Document your work clearly in a README file

---

## Data Files
You will work with two data files located in the `Data/` directory:

1. **IP-004_S38_L001_scaffolds.fasta** (~10 MB)
   - Genomic scaffolds from a sequencing assembly
   - Contains multiple contigs with headers in format: `>NODE_X_length_Y_cov_Z`
   - Example: `>NODE_1_length_21257_cov_6.323607`

2. **humchrx.txt** (~152 KB)
   - UniProt protein database entries for human chromosome X
   - Tab-delimited text file with multiple fields
   - Contains protein IDs, names, gene names, and descriptions

---

## Assignment Tasks

### Part 1: Fork, Clone, and Setup (Required First Step)

**Task 1.1**: Fork the starter repository
- Navigate to the instructor's starter repository on GitHub: `https://github.com/kipkurui/bash_miniproject`
- Click the "Fork" button in the top-right corner
- This creates a copy of the repository under your GitHub account
- Your forked repository will be named: `bash_miniproject`

**Task 1.2**: Clone your forked repository
- On your forked repository page, click the green "Code" button
- Copy the repository URL (HTTPS or SSH)
- Open your terminal and navigate to where you want to work
- Clone the repository:
  ```bash
  git clone [YOUR_FORKED_REPO_URL]
  cd bash_miniproject
  ```

**Task 1.3**: Explore the starter files
- Use `ls -la` to see all files (including hidden files like `.gitignore`)
- Examine the contents:
  - `Data/` directory with the two data files
  - `README.md` template that you'll complete
  - `.gitignore` file that you'll extend
  - `ASSIGNMENT.md` with these instructions

**Task 1.4**: Create working directories
- Create a `scripts/` directory for your bash scripts
- Create a `results/` directory for your output files
- Commands:
  ```bash
  mkdir scripts
  mkdir results
  ```

**Task 1.5**: Complete the README.md template
- Open `README.md` in a text editor
- Fill in the sections marked with `[TODO]`:
  - Your name and student ID
  - Date started
  - Any initial observations about the project

**Task 1.6**: Extend the .gitignore file
- Open `.gitignore` in a text editor
- The starter file already excludes some items
- Add additional patterns to exclude:
  - Temporary files (`*.tmp`, `*~`)
  - Any editor backup files specific to your editor

**Task 1.7**: Make your first commit
- Stage your changes (new directories and updated files):
  ```bash
  git add scripts/ results/ README.md .gitignore
  git commit -m "Complete initial setup: add directories and personalize README"
  ```

**Task 1.8**: Push to your GitHub fork
- Push your changes to GitHub:
  ```bash
  git push origin main
  ```
- Verify the changes appear on your GitHub repository page

**Deliverable**: Your forked repository on GitHub with initial setup complete

---

### Part 2: FASTA File Exploration

**Objective**: Use basic bash commands to explore the scaffold FASTA file.

**Task 2.1**: Count sequences
Write a bash command (or short script) to count how many sequences are in the FASTA file.
- Hint: FASTA headers start with `>`
- Save your answer in `results/sequence_count.txt`

**Task 2.2**: Extract sequence identifiers
Create a script `scripts/extract_headers.sh` that:
- Extracts all sequence headers from the FASTA file
- Saves only the NODE identifiers (e.g., NODE_1, NODE_2, etc.) to `results/sequence_ids.txt`
- Prints a message: "Extracted X sequence identifiers"

**Task 2.3**: Find the longest sequence
Write a script `scripts/longest_sequence.sh` that:
- Identifies which scaffold (NODE_X) has the longest sequence
- Reports the sequence length (extracted from the header)
- Saves the result to `results/longest_sequence.txt` in format:
  ```
  Longest sequence: NODE_X
  Length: Y bases
  Coverage: Z
  ```

**Git checkpoint**: Commit your Part 2 work with message: "Add FASTA exploration scripts"

---

### Part 3: Sequence Filtering and Statistics

**Objective**: Filter sequences based on criteria and generate summary statistics.

**Task 3.1**: Filter by length
Create a script `scripts/filter_by_length.sh` that:
- Takes a minimum length as a command-line argument (e.g., `./filter_by_length.sh 5000`)
- Extracts all sequence headers where length >= minimum length
- Counts how many sequences meet the criteria
- Saves the filtered headers to `results/filtered_sequences.txt`
- Prints summary: "Found X sequences with length >= Y bases"

**Task 3.2**: High-quality scaffolds
Create a script `scripts/high_quality_scaffolds.sh` that:
- Identifies scaffolds meeting BOTH criteria:
  - Length >= 10000 bases
  - Coverage >= 5.0
- Counts how many scaffolds are "high quality"
- Saves the list to `results/high_quality_scaffolds.txt`

**Git checkpoint**: Commit your Part 3 work with message: "Add filtering and statistics scripts"

---

### Part 4: Protein Database Analysis

**Objective**: Process the UniProt text file to extract specific information.

**Task 4.1**: Count protein entries
Write a command or script to count how many protein entries are in `humchrx.txt`.
- Save the count to `results/protein_count.txt`

**Task 4.2**: Extract gene names
Create a script `scripts/extract_genes.sh` that:
- Extracts all unique gene names from the file
- Sorts them alphabetically
- Saves to `results/gene_names_sorted.txt`
- Hint: Look for patterns in the text file structure. Gene names often appear in a specific field or format.

**Task 4.3**: Search for specific proteins
Create a script `scripts/search_proteins.sh` that:
- Takes a search term as argument (e.g., `./search_proteins.sh "kinase"`)
- Searches for all proteins whose description contains the search term (case-insensitive)
- Counts how many matches were found
- Displays the matching protein IDs and descriptions
- Saves results to `results/protein_search_results.txt`

**Git checkpoint**: Commit your Part 4 work with message: "Add protein database analysis scripts"

---

### Part 5: Master Analysis Script

**Objective**: Create a comprehensive script that combines multiple analyses.

**Task 5.1**: Create master script
Write a script `scripts/run_analysis.sh` that:
- Has proper shebang (`#!/bin/bash`)
- Includes comments explaining each section
- Accepts the data directory as a command-line argument
- Runs all previous analyses in sequence:
  1. FASTA exploration
  2. Sequence filtering
  3. Protein database analysis
- Creates the `results/` directory if it doesn't exist
- Prints progress messages as each analysis completes
- Generates a final summary file `results/analysis_summary.txt` containing:
  - Total sequences in FASTA file
  - Number of high-quality scaffolds
  - Total protein entries
  - Date and time analysis was run

**Task 5.2**: Make script executable
- Use `chmod` to make your script executable
- Test running it: `./scripts/run_analysis.sh /path/to/Data/`

**Task 5.3**: Error handling
Enhance `run_analysis.sh` with:
- Check that data files exist before processing
- Print error message and exit if files are missing
- Validate that at least one command-line argument was provided

**Git checkpoint**: Commit your Part 5 work with message: "Add master analysis script with error handling"

---

### Part 6: Documentation and Final Submission

**Task 6.1**: Complete README.md
Update your README.md to include:
- **Project Description**: Brief overview of what this project does
- **Requirements**: List prerequisites (bash, access to data files)
- **Usage Instructions**:
  - How to clone the repository
  - How to run each script
  - Example commands with expected output
- **File Descriptions**: Brief description of each script
- **Results Summary**: Key findings from your analyses
- **Author Information**: Your name, course, date

**Task 6.2**: Review Git history
- Ensure you have meaningful commit messages
- Verify you have at least 5 commits showing your progress
- Each commit should represent a logical unit of work

**Task 6.3**: Final push to GitHub
- Stage any remaining changes
- Make final commit: "Complete mini-project with documentation"
- Push all commits to GitHub
- Verify everything is visible on GitHub

**Task 6.4**: Test instructions
- Clone your repository to a different location
- Follow your own README instructions to verify they work
- Fix any issues and push corrections

---

## Submission Instructions

1. **Ensure all your work is pushed to your forked GitHub repository**
2. **Verify your repository is public** (it should be public by default when forked)
3. **Submit your forked repository URL** via the course submission system
   - Format: `https://github.com/[YourUsername]/bash_miniproject`
4. Your repository must include:
   - All scripts in `scripts/` directory
   - All results in `results/` directory (committed and pushed)
   - Complete README.md with all sections filled in
   - At least 5 meaningful commits beyond the initial setup
   - Extended .gitignore file
   - Original data files in `Data/` directory (unchanged)

---

## Grading Criteria

This assignment is worth **30 points** and will be graded on:
- **Correct Output** (12 points): Scripts produce accurate results
- **Git Practices** (9 points): Proper repository structure, commits, documentation
- **Code Quality** (9 points): Clean, readable, well-commented scripts

See the detailed grading rubric provided separately.

---

## Tips for Success

1. **Start early**: Don't wait until the last day
2. **Test frequently**: Run your scripts often to catch errors early
3. **Commit often**: Make small, logical commits as you work
4. **Read man pages**: Use `man command` to learn about commands
5. **Use pipes**: Chain commands together with `|` for efficiency
6. **Comment your code**: Explain what your scripts do
7. **Ask for help**: If stuck, refer to lecture materials or ask questions

---

## Resources

- [Introduction to Linux Lectures](https://github.com/amelgh/Introduction_To_Linux/tree/master/Lectures)
- Course lecture materials (ModuleLinux_Session1.pdf)
- Git and GitHub documentation
- Bash command reference: `man bash`

---

## Academic Integrity

This is an individual assignment. You may discuss general concepts with classmates, but all scripts and documentation must be your own work. Copying code from others or online sources without attribution is plagiarism.

---

**Good luck! Remember: computational thinking is about breaking problems into steps and solving them systematically.**
