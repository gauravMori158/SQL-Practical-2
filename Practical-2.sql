--Create Two Tables
--Table 1 Department table contains below columns
--DepartmentId int primarykey
--Department Name varchar(200)



--Table 2. Employee contains below columns
--EmployeeId int primary key (should be autoincrement)
--EmployeeName
--DepartmentId
--Experience
--Salary


--Write below query
--Write a Query display empId,EmpName and DepartmentName
--Write a Query to display department wise employee count
--Write a Query to display department wise maximum salary
--Write a Query to display employee name in the ascending order of department name
--Write a Query to display employeeName and grade where grade criteria is as below
--if employee has more than 10 years of experience then grade is expert
--if employee has experience between 7 to 10 years then its grade is advanced
--if employee has experience between 5 to 7 years then its grade is intermediate
--if employee has experience between 2 to 5 year then its grade is beginner
--and for the rest of case display grade as novice


CREATE TABLE tbl_Department (
DepartmentId int PRIMARY KEY,
DepartmentName VARCHAR(200)
) 

INSERT INTO tbl_Department VALUES (1,'ASP.NET'),(2,'REACT'),(3,'JAVA'),(4,'PYTHON'),(5,'PHP');
 
SELECT * FROM tbl_Department


CREATE TABLE tbl_Employee (
EmployeeId INT IDENTITY(1,1) PRIMARY KEY,
EmployeeName VARCHAR (30),
DepartmentId INT NOT NULL,
Experience INT NOT NULL,
Salary INT NOT NULL,
FOREIGN KEY (DepartmentId) REFERENCES tbl_Department (DepartmentId) 
)

INSERT INTO tbl_Employee  (EmployeeName, DepartmentId, Experience, Salary ) VALUES 
('GAURAV', 1,9,75000),
('JAY', 1,10,85000),
('BHAVIN', 3,2,43000),
('VIDUR', 4,6,65000),
('RONAK', 2,5,70000),
('KAUSHAL', 5,3,77000),
('AVADH', 1,10,95000),
('BELLANI', 2,3,55000),
('DEEP',3,3,59000),
('YASH', 2,7,79000)

SELECT * FROM tbl_Employee



--Write a Query display empId,EmpName and DepartmentName

SELECT EmployeeId, EmployeeName ,DepartmentName FROM tbl_Employee 
INNER JOIN tbl_Department ON tbl_Employee.DepartmentId = tbl_Department.DepartmentId -- can use left/right join


--Write a Query to display department wise employee count

SELECT DepartmentName , COUNT(*) AS 'Employee Count' FROM tbl_Employee 
INNER JOIN tbl_Department ON tbl_Employee.DepartmentId = tbl_Department.DepartmentId 
GROUP BY DepartmentName ORDER BY  DepartmentName ASC



--Write a Query to display department wise maximum salary

SELECT DepartmentName , MAX(Salary) AS 'Employee Max Salary' FROM tbl_Employee 
INNER JOIN tbl_Department ON tbl_Employee.DepartmentId = tbl_Department.DepartmentId 
GROUP BY DepartmentName ORDER BY  DepartmentName ASC


--Write a Query to display employee name in the ascending order of department name
 

SELECT EmployeeName , DepartmentName FROM tbl_Employee 
INNER JOIN tbl_Department ON tbl_Employee.DepartmentId = tbl_Department.DepartmentId 
ORDER BY  DepartmentName ASC



--Write a Query to display employeeName and grade where grade criteria is as below
--if employee has more than 10 years of experience then grade is expert
--if employee has experience between 7 to 10 years then its grade is advanced
--if employee has experience between 5 to 7 years then its grade is intermediate
--if employee has experience between 2 to 5 year then its grade is beginner
--and for the rest of case display grade as novice

SELECT EmployeeName,Experience, CASE
WHEN Experience > 10 THEN  'Expert'
WHEN Experience BETWEEN 7 AND 10 THEN  'Advanced'
WHEN Experience BETWEEN 5 AND 7 THEN  'Intermediate'
WHEN Experience BETWEEN 2 AND 5 THEN  'Beginner'
ELSE 'Novice'
END
AS 'GARDES' FROM tbl_Employee 
INNER JOIN tbl_Department ON tbl_Employee.DepartmentId = tbl_Department.DepartmentId 


