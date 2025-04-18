# Python Test for Data Engineers

## Instructions

Before starting, please ensure you run the main file (`main.py`) to initialize the program and verify the setup.

**File Locations:**
- `processing.py` is located in the `app` folder. It contains the main logic for processing and analyzing data.
- `test_processing.py` is located in the `tests` folder. Use this file to create and run unit tests for verifying the correctness of your implementation.
- `main.py` is located in the `app` folder. It serves as the entry point to run the program.

---

## Data Description

The dataset consists of the following key components:

### DRILLHOLES
Contains information about drillhole locations, including:

- **Name**: Unique identifier for each drillhole.
- **X and Y**: Coordinates of the drillhole.
- **Length (m)**: Length of the drillhole in meters.

### SAMPLES
Contains sample data for each drillhole, including:

- **Name**: Drillhole identifier (corresponds to DRILLHOLES).
- **ID**: Sample identifier.
- **Au**: Gold grade for the sample.

### EXTRA_DH_DATA
Provides metadata for drillholes, including:

- **Name**: Drillhole identifier.
- **Item**: Type of metadata (e.g., `DATE`, `COMPANY`).
- **Value**: Corresponding value for the metadata type (e.g., specific date or company name).

---

## Grading Scheme:
- Each task is worth **10%** of the total score.
- **Bonus Points:** Up to **10% extra** for exceptional code quality, such as readability, modularity, use of best practices, and efficient algorithms.

**Note:** Students are encouraged to create new files as needed or use the existing `processing.py` file to solve these questions.

---

## Tasks:

1) There is a bug in this code which causes the incorrect 'Average Au Grade' to be reported. Find and fix the issue.  
   - **File to Start:** `processing.py`

2) Refactor the existing code to your satisfaction, with the aim of making the code more readable, as well as being more suitable for creating unit tests.  
   - **File to Start:** `processing.py`
 
3) Create a unit test to ensure that the average Au grade calculation is performed correctly.  
   - **File to Start:** `test_processing.py`

4) Make sure the program fails nicely if it can't access data, or fails otherwise.  
   - **File to Start:** `processing.py`  
   - **Hint:** Add error handling for scenarios like missing files and invalid data input/formats data output. Ensure meaningful error messages are shown.

5) Extend the code to retrieve the additional data from the spreadsheet table 'EXTRA_DH_DATA'.  
   - **File to Start:** `processing.py`

6) Report on the total drilled meters by Company.  
   - **File to Start:** `processing.py`

7) Report on the total meters drilled per day (1st, 2nd, 3rd, and 4th October).  
   - **File to Start:** `processing.py`

8) Write code to calculate the distance from a new hole at X=2.5 and Y=32.5 to all of the other holes.  
   - **File to Start:** `processing.py`

9) To estimate the AuGrade for the new hole, use the average Au Grade from the four closest drillholes.  
   - **File to Start:** `processing.py`

10) Repeat step 8 and 9 for the following new drillholes:       
    - X = 7.5, Y = 32.5  
    - X = 2.5, Y = 37.5  
    - X = 7.5, Y = 37.5  
   - **File to Start:** `processing.py`

---

## Submission Instructions:

- Please ensure all your solutions are documented and organized.
- Submit your solutions by filling in the **answer sheet file** provided with the project.
- Include the GitHub repository link to your solution in the answer sheet.
- Ensure the answer sheet is complete before submission.

Good luck!
