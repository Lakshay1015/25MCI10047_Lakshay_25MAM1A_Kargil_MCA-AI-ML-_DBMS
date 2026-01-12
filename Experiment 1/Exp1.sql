create database exp1;
create table Department 
(
Deptid int PRIMARY KEY,
Deptname varchar(20) NOT NULL UNIQUE
);

CREATE TABLE Employee (
Empid int PRIMARY KEY,
Empname varchar(20) NOT NULL,
Empemail varchar(30) UNIQUE NOT NULL,
Empphone varchar(10) UNIQUE NOT NULL,
Deptid int,
FOREIGN KEY (Deptid) REFERENCES Department(Deptid)
);

CREATE TABLE Project
(
Projid int PRIMARY KEY,
Projname varchar(40) NOT NULL,
ProjstartDate date NOT NULL,
ProjendDate date NOT NULL,
ProjAssignEmp int,
FOREIGN KEY (ProjAssignEmp) REFERENCES Employee(Empid)
);

insert into Department (Deptid, Deptname) values
(1,'Marketing'),(2,'Finance'),(3,'IT'),(4,'HR');

insert into Employee(Empid, Empname, Empemail, Empphone, Deptid) values
(101,'Lakshay','Lakshay@gamil.com',9465550343,1),
(102,'Neha','NehaAgg@gamil.com',6284511540,2),
(103,'Saneha','Saneha@gamil.com',1234567891,3),
(104,'Priya','Priya@gamil.com',9876543210,4),
(105,'Tushar','Tushar@gamil.com',7986015080,1);

insert into Project(Projid, Projname, ProjstartDate, ProjendDate, ProjAssignEmp)values
(501,'Festive Promotion Campaign','2026-01-01','2026-01-31',105),
(502,'Payout Maintainence','2026-01-28','2026-01-31',104),
(503,'ERP Development','2026-01-01','2026-01-15',103),
(504,'Tax Auditng for month','2026-01-20','2026-01-29',102),
(505,'Market Funnet Analysis','2026-01-21','2026-01-30',101)
(506,'Brand Perception Analysis','2026-01-01','2026-01-31',101);

UPDATE Employee
SET Empphone = 6239787133
WHERE Empid = 104;

DELETE FROM Project
WHERE ProjAssignEmp = 104;

DELETE FROM Employee
WHERE Empid = 104;

SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Project;

CREATE ROLE Manager LOGIN PASSWORD 'Manager@2020';

GRANT SELECT ON Department, Employee, Project TO Manager;
REVOKE SELECT ON Project FROM Manager;

