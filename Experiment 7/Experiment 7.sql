create table student(
s_id int primary key,
s_name varchar(50),
dept_id int
);
create table department(
dept_id int primary key,
dept_name varchar(50)
);
create table course(
c_id int primary key,
c_name varchar(50)
);
create table enrollment(
s_id int,
c_id int,
primary key (s_id,c_id),
foreign key (s_id) references student(s_id),
foreign key (c_id) references course(c_id)
);

INSERT INTO department VALUES (1, 'CSE');
INSERT INTO department VALUES (2, 'IT');
INSERT INTO department VALUES (3, 'ECE');

INSERT INTO student VALUES (101, 'Lakshay', 1);
INSERT INTO student VALUES (102, 'neha', 2);
INSERT INTO student VALUES (103, 'tushar', 1);
INSERT INTO student VALUES (104, 'hardik', 3);
INSERT INTO student VALUES (105, 'kashish', 2);

INSERT INTO course VALUES (201, 'Oracle');
INSERT INTO course VALUES (202, 'SAP');
INSERT INTO course VALUES (203, 'IBM');
INSERT INTO course VALUES (204, 'Microsoft');

INSERT INTO enrollment VALUES (101, 201);
INSERT INTO enrollment VALUES (101, 202);
INSERT INTO enrollment VALUES (102, 203);
INSERT INTO enrollment VALUES (103, 201);
INSERT INTO enrollment VALUES (104, 204);

select * from student;
select * from department;
select * from course;
select * from enrollment;

SELECT s.s_id, s.s_name, c.c_name
FROM student s
INNER JOIN enrollment e ON s.s_id = e.s_id
INNER JOIN course c ON e.c_id = c.c_id;

SELECT s.s_id, s.s_name
FROM student s
LEFT JOIN enrollment e ON s.s_id = e.s_id
WHERE e.c_id IS NULL;

SELECT s.s_name, c.c_name
FROM enrollment e
RIGHT JOIN course c ON e.c_id = c.c_id
LEFT JOIN student s ON e.s_id = s.s_id;

SELECT s.s_id, s.s_name, d.dept_name
FROM student s
INNER JOIN department d ON s.dept_id = d.dept_id;

SELECT s.s_name, c.c_name
FROM student s
CROSS JOIN course c;