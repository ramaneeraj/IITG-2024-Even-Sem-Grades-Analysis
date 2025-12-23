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
