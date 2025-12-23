# 📊 SQL Project: Grade Analysis (Even Semester 2024)

This project focuses on analyzing **course-wise grade distribution data** for the **Even Semester 2024** using **MySQL**.  
The objective is to practice **SQL fundamentals, analytical queries, subqueries, and data validation techniques** on a real academic dataset.

---

## 🗂️ Dataset Overview

The dataset contains grade statistics for multiple courses, including:

- Course details (Code, Name)
- Grade distribution (AS, AA, AB, BB, BC, CC, CD, DD)
- Failure categories (FA, FD, FP)
- Special cases (I, NP, PP)
- Total students per course
- Administrative details (HoD, Hardcopy status)

Each row represents **one course**.

---

## 🛠️ Technologies Used

- **MySQL**
- **SQL (DDL + DML + Analytical Queries)**
- **Git & GitHub**

---

## 🧱 Database Schema

### Database
```sql
CREATE DATABASE IF NOT EXISTS sql_project1;
USE sql_project1;
```

### Create Table
```sql
CREATE TABLE IF NOT EXISTS Grades_2024(
    S_No INT PRIMARY KEY,
    Course_Code VARCHAR(20),
    Course_Name VARCHAR(100),
    A_S INT,
    AA INT,
    AB INT,
    BB INT,
    BC INT,
    CC INT,
    CD INT,
    DD INT,
    FA INT,
    FD INT,
    FP INT,
    I INT,
    NP INT,
    PP INT,
    Grand_Total INT,
    HoD VARCHAR(15),
    Hardcopy_Received VARCHAR(10)
);
```

## 🔍 Data Verification

### Check Number of Records
```sql
SELECT COUNT(*) FROM grades_2024;
```

### View Full Dataset
```sql
SELECT * FROM grades_2024;
```

## 📌 SQL Queries

### List All Distinct Courses
```sql
SELECT DISTINCT Course_Code, Course_Name
FROM grades_2024;
```

### Courses where no student failed due to FP (Failure due to performance)
```sql
SELECT S_No, Course_Code, Course_Name FROM grades_2024 
WHERE FP=0;
```

### Courses With Attendance Failures
```sql
SELECT S_No, Course_Code, Course_Name
FROM grades_2024
WHERE FA > 0;
```

### Course With Highest Number of AS Grades
```sql
SELECT S_No, Course_Code, Course_Name, A_S
FROM grades_2024
ORDER BY A_S DESC
LIMIT 1;
```

### Course With Maximum Failures
```sql
SELECT S_No, Course_Code, Course_Name
FROM grades_2024
ORDER BY (FA + FD + FP) DESC
LIMIT 1;
```

### Courses Where More Than 50% Students Got BB or Better
```sql
SELECT S_No, Course_Code, Course_Name
FROM grades_2024
WHERE (A_S + AA + AB + BB) > 0.5 * Grand_Total;
```

## 📈 Percentage-Based Analysis

### Failure Percentage for Each Course
```sql
SELECT 
  S_No,
  Course_Code,
  Course_Name,
  (FA + FD + FP) * 100.0 / Grand_Total AS Failure_Percentage
FROM grades_2024;
```

### Pass Percentage for Each Course
```sql
SELECT 
  S_No,
  Course_Code,
  Course_Name,
  A_S + AA + AB + BB + BC + CC + CD + DD) * 100.0 / Grand_Total AS Pass_Percentage
FROM grades_2024;
```

## ✅ Data Consistency Validation
```sql
SELECT S_No, Course_Code, Course_Name
FROM grades_2024
WHERE
(A_S + AA + AB + BB + BC + CC + CD + DD +
 FA + FD + FP + I + NP + PP) != Grand_Total;
```

## 📊 Average Failure Rate
```sql
SELECT 
 AVG(Percentage_Of_Failures) AS Average_Failure_Rate
FROM (
    SELECT 
      (FA + FD + FP) * 100.0 / Grand_Total AS Percentage_Of_Failures
    FROM grades_2024
) t;
```


