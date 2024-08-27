--Task 2: Student Database Management System (PostgreSQL)**

--1. Database Setup

--Create a database named “student_database.”
CREATE DATABASE student_database;

--Create a table called “student_table”
CREATE TABLE student_table (
    Student_id INT PRIMARY KEY,
    Stu_name TEXT,
    Department TEXT,
    Email_id TEXT,
    Phone_no NUMERIC,
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC,
    Grade CHAR(1)
);


--2. Data Entry

-- Insert 10 sample records into “student_table”
INSERT INTO student_table (Student_id, Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES
(1, 'Bruce Wayne', 'Science', 'bruce@waynecorp.com', 1234567890, 'Gotham', '1980-05-27', 'Male', 'Physics', 3.9, 'A'),
(2, 'Clark Kent', 'Journalism', 'clark@dailyplanet.com', 9876543210, 'Metropolis', '1978-06-18', 'Male', 'Communication', 3.8, 'B'),
(3, 'Diana Prince', 'History', 'diana@themiscira.com', 5556667777, 'Themyscira', '1984-03-22', 'Female', 'Mythology', 4.0, 'A'),
(4, 'Barry Allen', 'Forensics', 'barry@ccpd.com', 3334445555, 'Central City', '1992-09-20', 'Male', 'Chemistry', 3.7, 'B'),
(5, 'Arthur Curry', 'Marine Biology', 'arthur@atlantis.com', 2223334444, 'Atlantis', '1985-01-29', 'Male', 'Biology', 3.6, 'C'),
(6, 'Hal Jordan', 'Aerospace', 'hal@usaf.com', 9998887777, 'Coast City', '1980-02-20', 'Male', 'Engineering', 3.5, 'B'),
(7, 'Victor Stone', 'Computer Science', 'victor@cyborg.com', 8887776666, 'Detroit', '1995-11-29', 'Male', 'Robotics', 3.9, 'A'),
(8, 'Oliver Queen', 'Political Science', 'oliver@queenind.com', 6665554444, 'Star City', '1983-07-15', 'Male', 'Law', 3.3, 'C'),
(9, 'Kara Danvers', 'Biology', 'kara@deo.com', 4443332222, 'National City', '1990-12-10', 'Female', 'Genetics', 3.8, 'B'),
(10, 'John Constantine', 'Occult Studies', 'john@hellblazer.com', 7776665555, 'Liverpool', '1975-05-10', 'Male', 'Theology', 3.4, 'C');

--3.Retrieve student info sorted by Grade

SELECT *
FROM student_table
ORDER BY Grade;

--4. Filter by Gender
SELECT *
FROM student_table
WHERE Gender = 'Male';

--5.filter as GPA <5

SELECT *
FROM student_table
WHERE GPA < 5.0 ;

--6.update student mail and grade

UPDATE student_table
SET Grade = 'B',email_id = 'john@heavenblazer.com'
WHERE Stu_name = 'John Constantine';


--7.Students with grade B

SELECT Stu_name, TIMESTAMPDIFF(YEAR, Date_of_birth, CURDATE()) AS Age
FROM student_table
WHERE Grade = 'B';

-- 8.grouping and calculation

SELECT Department,Gender, AVG(GPA) AS AvgGPA
FROM student_table
GROUP BY Department,Gender;

--9.renaming table
ALTER TABLE student_table RENAME TO student_info;

--10. student with highest GPA
SELECT Stu_name FROM student_info
ORDER BY GPA DESC
LIMIT 1;



