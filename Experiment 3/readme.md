
# Experiment 03 – Conditional Logic Using CASE and IF–ELSE

## Student Information
- Name: Lakshay Aggarwal  
- UID: 25MCI10047  
- Branch: MCA (AI & ML)  
- Section: MAM-1 A  
- Semester: Second Semester  
- Subject: Technical Training - I  
- Date of Performance: 12/01/2026  

---

## Aim
To implement conditional decision-making logic in PostgreSQL using CASE expressions and IF–ELSE constructs for classification, validation, and rule-based data processing.

---

## Software Requirements
- PostgreSQL  
- pgAdmin  
- Oracle Database Express Edition (optional)

---

## Objectives
- Understand conditional execution in SQL  
- Implement decision-making logic using CASE expressions  
- Simulate real-world rule validation scenarios  
- Classify data based on multiple conditions  
- Strengthen SQL logic skills required in interviews and backend systems  

---

## Step 1: Database and Table Preparation

```sql
CREATE TABLE Violations (
    id INT PRIMARY KEY,
    entity_name VARCHAR(100),
    violation_count INT
);
```

```sql
INSERT INTO Violations VALUES
(1, 'Passenger_data', 11),
(2, 'Payment_data', 6),
(3, 'Booking_data', 20),
(4, 'Seat_data', 2),
(5, 'Refund_data', 0),
(6, 'Staff_data', 12);
```

### Output
![Output](images/voilation_table.png)

---

## Step 2: CASE Classification

```sql
SELECT entity_name, violation_count,
CASE
    WHEN violation_count = 0 THEN 'No Violation'
    WHEN violation_count BETWEEN 1 AND 5 THEN 'Minor Violation'
    WHEN violation_count BETWEEN 6 AND 15 THEN 'Moderate Violation'
    ELSE 'Critical Violation'
END AS Violation_Status
FROM Violations;
```

### Output
![Output](images/voilation_status.png)

---

## Step 3: CASE Updates

```sql
ALTER TABLE Violations
ADD COLUMN approval_status VARCHAR(30);
```

```sql
UPDATE Violations
SET approval_status =
CASE
    WHEN violation_count = 0 THEN 'Approved'
    WHEN violation_count BETWEEN 1 AND 15 THEN 'Needs Review'
    ELSE 'Rejected'
END;
```

### Output
![Output](images/update_voilation.png)

---

## Step 4: IF–ELSE Using PL/pgSQL

```sql
DO $$
DECLARE
    v_violation_count INT := 12;
BEGIN
    IF v_violation_count = 0 THEN
        RAISE NOTICE 'Approved';
    ELSIF v_violation_count BETWEEN 1 AND 5 THEN
        RAISE NOTICE 'Minor Violation';
    ELSIF v_violation_count BETWEEN 6 AND 15 THEN
        RAISE NOTICE 'Moderate Violation';
    ELSE
        RAISE NOTICE 'Critical Violation';
    END IF;
END $$;
```

### Output
![Output](images/if_else.png)

---

## Step 5: Grading System

```sql
CREATE TABLE StudentGrades (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT
);
```

```sql
INSERT INTO Grades (student_name, marks) VALUES
('Lakshay', 95),
('Neha', 82),
('Tushar', 68),
('Priya', 91),
('Sam', 56),
('Diya', 45),
('Tanu', 77),
('Sneha', 88);
```
### Output
![Output](images/grade_table.png)
```sql
SELECT student_name, marks,
CASE
    WHEN marks >= 90 THEN 'A+ Grade'
    WHEN marks BETWEEN 80 AND 89 THEN 'A Grade'
    WHEN marks BETWEEN 70 AND 79 THEN 'B Grade'
    WHEN marks BETWEEN 60 AND 69 THEN 'C Grade'
    WHEN marks BETWEEN 40 AND 59 THEN 'D Grade'
    ELSE 'Fail'
END AS Grade
FROM StudentGrades;
```

### Output
![Output](images/grade_table_classify.png)

---

## Step 6: CASE for Custom Sorting

```sql
SELECT entity_name, violation_count,
CASE
    WHEN violation_count > 15 THEN 'Critical Violation'
    WHEN violation_count BETWEEN 6 AND 15 THEN 'Moderate Violation'
    WHEN violation_count BETWEEN 1 AND 5 THEN 'Minor Violation'
    ELSE 'No Violation'
END AS Severity
FROM Violations
ORDER BY
CASE
    WHEN violation_count > 15 THEN 1
    WHEN violation_count BETWEEN 6 AND 15 THEN 2
    WHEN violation_count BETWEEN 1 AND 5 THEN 3
    ELSE 4
END;
```

### Output
![Output](images/voilation_sort.png)

---

## Learning Outcomes
- Implemented CASE expressions for classification  
- Used IF–ELSE procedural logic  
- Applied conditional updates  
- Performed rule-based sorting  
- Improved backend SQL decision logic  

---

## Conclusion
This worksheet demonstrated practical implementation of conditional logic in PostgreSQL using CASE and IF–ELSE constructs for real-world scenarios.
