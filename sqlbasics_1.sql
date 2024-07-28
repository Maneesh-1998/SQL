/* create database */
CREATE DATABASE d1;

# delete database
DROP DATABASE d1;


-- create database
CREATE DATABASE maneesh_db;

-- create table 
USE maneesh_db;
CREATE TABLE student(
student_id VARCHAR(10) NOT NULL,
student_name VARCHAR(100) NOT NULL,
age INT NOT NULL,
place VARCHAR(100) NOT NULL,
PRIMARY KEY(student_id)
);


-- create  another table , name:test1
USE maneesh_db;
CREATE TABLE test1(
student_id VARCHAR(10) NOT NULL,
student_name VARCHAR(100) NOT NULL,
age INT NOT NULL,
place VARCHAR(100) NOT NULL,
PRIMARY KEY(student_id)
);

-- delete test1 table
USE maneesh_db;
DROP TABLE test1;



-- selects all the columns from the student table
SELECT * FROM student;



-- inserting single record or row
INSERT INTO student(student_id,student_name,age,place)
VALUE('s1','maneesh kumar',28,'kasaragod');

-- select  table
SELECT * FROM student;





-- adding multiple records
INSERT INTO student
VALUE
('s2','kumar',28,'kasaragod'),
('s3','anugha',26,'kozhikode'),
('s4','balakrishna',32,'kannur'),
('s5','karthik',30,'kottayam'),
('s6','shankara',31,'trivandrum'),
('s7','shyam',22,'palakad'),
('s8','gopalan',22,'kollam'),
('s9','sreekutty',20,'trissure'),
('s10','hanuman',23,'ernakulam'),
('s11','govinda',26,'kasaragod'),
('s12','hanuman',21,'kasaragod');

-- select table
SELECT * FROM student;



-- update records
USE maneesh_db;
UPDATE student
SET place='edneer'
WHERE student_id='s1';

-- select table
SELECT * from student;



-- copy table
USE maneesh_db;
CREATE TABLE student_1 LIKE student;
INSERT student_1 SELECT * FROM student;

-- refresh or select table
SELECT * FROM student_1;




-- delete record or single row
DELETE FROM student_1 WHERE student_id='s2';

-- refresh
SELECT * FROM student_1;





-- select statement
SELECT * FROM student;

-- select statement using student id
SELECT student_id FROM student;


-- select statement using student id and student name
SELECT student_id,student_name FROM student;



-- select statement using student id and place
SELECT student_name,place FROM student;



-- where clause (used for filter data)
SELECT * FROM student
WHERE place='kasaragod';

SELECT * FROM student
WHERE age=30;

SELECT * FROM student
WHERE age<30;



-- distinct clause(no repeating data)
USE maneesh_db;
SELECT DISTINCT place FROM student;


-- from clause
SELECT * FROM student;
SELECT student_name FROM student;


-- orderby clause(sorting ascending order or descending order)
SELECT * FROM student;
SELECT * FROM student ORDER BY student_name ASC;



-- adding column
USE maneesh_db;
ALTER TABLE student ADD contact INT(10) NOT NULL;
-- refresh
SELECT * FROM student;


-- modify column(changing data type)
USE maneesh_db;
ALTER TABLE student MODIFY contact VARCHAR(10) NOT NULL;
-- refresh
SELECT * FROM student;



-- rename column
USE maneesh_db;
ALTER TABLE student RENAME  COLUMN contact TO student_contact;
-- refresh
SELECT * FROM student;


-- delete column
USE maneesh_db;
ALTER TABLE student DROP COLUMN student_contact;
-- refresh
SELECT * FROM student;


-- truncate ( delete all records from table)
USE maneesh_db;
SELECT * FROM student_1;
TRUNCATE student_1;
-- refresh
SELECT * FROM student_1;

-- delete table
DROP TABLE student_1;
-- refresh
SELECT * FROM student_1;


















