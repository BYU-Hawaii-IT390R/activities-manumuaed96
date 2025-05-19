# Recursive Directory Scanner with Python

## Objective
This script recursively scans a given directory and all its subdirectories to find all `.txt` files. It displays a clean, readable table showing each file’s relative path and size in kilobytes.

---

## Enhancement Chosen
**--min-size**  
An optional command-line argument that allows me to filter and only show `.txt` files larger than a given size (in kilobytes). This is helpful when I was only interested in more substantial files.

---

## How to Run
I run this on terminal python scan.py test_root
Then run this code python scan.py test_root --min-size 0.5 & python scan.py test_root --min-size 10

### Step-by-step:

#### 1. Open a terminal or command prompt
Make sure I was inside the `Activity-01/` folder where my scripts live.

#### 2. Generate the test folder and files
Run the setup script to create a realistic test environment:

```bash
python setup_files.py