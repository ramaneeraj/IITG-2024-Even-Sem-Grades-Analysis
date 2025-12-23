-- Create Data Base
CREATE DATABASE IF NOT EXISTS sql_project1;

-- Create table
USE sql_project1;

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

-- Verify whether all records are imported
SELECT COUNT(*) FROM grades_2024;

-- View data in table
SELECT * FROM grades_2024;

-- View distinct courses available in even-sem
SELECT DISTINCT Course_Code, Course_Name FROM grades_2024;

-- View courses where no student failed due to FP
SELECT S_No, Course_Code, Course_Name FROM grades_2024 
WHERE FP=0;

-- View courses where students failed due to attendance
SELECT S_No, Course_Code, Course_Name FROM grades_2024
WHERE FA>0;

-- Find course with highest no of AS grades
SELECT S_No, Course_Code, Course_Name, A_S FROM grades_2024
ORDER BY A_S DESC 
LIMIT 1;
    
-- Find course with maximum no of failures
SELECT S_No, Course_Code, Course_Name FROM grades_2024
ORDER BY FA+FD+FP DESC
LIMIT 1;   

-- Find courses where more than 50% students got BB or better
SELECT S_No, Course_Code, Course_Name FROM grades_2024
WHERE (A_S+AA+AB+BB)>0.5*Grand_Total;

-- Find course with highest enrollment
SELECT S_No, Course_Code, Course_Name FROM grades_2024
ORDER BY Grand_Total DESC
LIMIT 1;

-- Find percentage of failures in each course
SELECT S_No, Course_Code, Course_Name, ((FA+FP+FD)/Grand_Total)*100 AS Percentage_Of_Failures FROM grades_2024;

-- Find pass percentage of each course
SELECT S_No, Course_Code, Course_Name, ((A_S+AA+AB+BB+BC+CC+CD+DD)/Grand_Total)*100 AS Pass_Percentage FROM grades_2024;

-- Find any error(if exists in grand total) in each course
SELECT S_No, Course_Code, Course_Name FROM grades_2024
WHERE (A_S+AA+AB+BB+BC+CC+CD+DD+FA+FD+FP+I+NP+PP)!=Grand_Total;

-- Find avg failure rate
SELECT AVG(Percentage_Of_Failures) AS Average_Failure_Rate FROM(
    SELECT ((FA+FD+FP)*100)/Grand_Total AS Percentage_Of_Failures FROM grades_2024
)t;