-- First and Last record
USE maneesh_db;
-- ASC (1 record from the first)
SELECT * FROM student ORDER BY student_id ASC LIMIT 1;
-- DESC (2 record from the last)
SELECT * FROM student ORDER BY student_id DESC LIMIT 2;


-- random record selection(limit 1 means 1 record)
SELECT * FROM student ORDER BY  rand() LIMIT 1;


-- Select AS statement( temporary change of field)
SELECT student_name AS 'first name',age As 'student_age', place FROM student;


/* OPERATORS */
/* SQL Arithmetic Operators */
-- Addition
SELECT 10+20 AS result;
-- Subtraction
SELECT 10-20 AS result;
-- Division
SELECT 10/20 AS result;
-- Multiplication
SELECT 10*20 AS result;
-- Modulus
SELECT 10%3 AS result;


/* SQL Comparison Operators */
-- Equal
SELECT 10=10 AS result;
-- Lessthan
SELECT 10<20 AS result;
-- greaterthan
SELECT 10>20 AS result;
-- Lessthan equal
SELECT 10<=20 AS result;
-- greaterthan equal
SELECT 10>=10 AS result;
-- Not equal
SELECT 20<>10 AS result;



-- comparison operator used in table
USE maneesh_db;
SELECT * FROM student WHERE age=20;
SELECT * FROM student WHERE age>20;
SELECT * FROM student WHERE age<20;
SELECT * FROM student WHERE age<=20;
SELECT * FROM student WHERE age>=20;
SELECT * FROM student WHERE age<>20;

/* SQL Logical  Operators */
-- AND
SELECT * FROM student WHERE age=28 AND place='kasaragod';

-- BETWEEN
SELECT * FROM student WHERE age BETWEEN 25 AND 30;

-- EXISTS
SELECT * FROM student WHERE EXISTS(SELECT age FROM student WHERE age>20);

-- IN 
SELECT * FROM student WHERE place IN('kasaragod','kannur');

-- LIKE
SELECT * FROM student WHERE student_name LIKE 'maneesh kumar';

SELECT * FROM student WHERE student_name LIKE 'a%';

SELECT * FROM student WHERE student_name LIKE '%a';

SELECT * FROM student WHERE student_name LIKE '%k%';

-- NOT LIKE
SELECT * FROM student WHERE student_name NOT LIKE 'maneesh kumar';

SELECT * FROM student WHERE age NOT LIKE 20;

SELECT * FROM student WHERE student_name NOT LIKE '%a';

-- OR 
SELECT * FROM student WHERE place='kasaragod' OR age=20;


/* String Function */
-- char_length()
SELECT *  FROM student;
SELECT place, char_length(place) AS length FROM student;

-- concat()
SELECT *  FROM student;
SELECT concat(student_name,' ',place ) AS new_string FROM student;

-- format()
SELECT format(250500.5634,2) AS nem_number;

-- insert()
SELECT  insert("google",1,1,"m");

SELECT  insert("google",1,3,"ban");

-- upper()
SELECT upper("hello maneesh kumar") AS nem_string;

-- lower()
SELECT lower("MANEESH KUMAR ") AS nem_string;

-- reverse()
SELECT reverse("KUMAR ") AS nem_string;

-- repeat()
-- SELECT repeat("hello",5) AS new_string;

-- left()
SELECT left("maneesh",2) AS new_string;


-- right()
SELECT right("maneesh",2) AS new_string;


-- length()
SELECT length("hello") AS new_string;



/* Math Functions */
-- abs
SELECT abs(-123) AS new_number;


-- average
USE maneesh_db;
SELECT avg(age) AS new_number FROM student;

-- ceiling
SELECT ceiling(2.5) AS new_number;

-- floor
SELECT floor(25.8) AS new_number;

-- round
SELECT round(25.5) AS new_number;

SELECT round(25.434,2) AS new_number;

-- count
USE maneesh_db;
SELECT count(student_id) AS total_student FROM student;

-- max
SELECT max(age) AS max_age FROM student;

-- min
SELECT min(age) AS min_age FROM student;

-- pi()
SELECT pi() AS pi_value;

-- rand()
SELECT rand() AS random_numbers;

SELECT rand()*11 AS random_numbers;


SELECT floor(rand()*11) AS random_numbers;

-- sqrt()
SELECT sqrt(9) AS new_number;

-- sum()
USE maneesh_db;
SELECT sum(age) AS new_number FROM student;


/* Date Functions */
SELECT  current_timestamp() AS time_stamp;

SELECT day("2024/7/25") AS new_day;

SELECT month("2024/7/25") AS new_month;


SELECT dayname("2024/7/25") AS new_dayname;


SELECT sysdate();


SELECT curdate();

SELECT curtime();

SELECT now();







/* table with foreign key */

USE maneesh_db;
CREATE TABLE courses(
course_id VARCHAR(5) NOT NULL,
course_name VARCHAR(50) NOT NULL,
PRIMARY KEY(course_id)
);

INSERT INTO courses
VALUES
('c1','computer hardware'),
('c2','networking'),
('c3','web designing'),
('c4','graphic designing'),
('c5','MS office'),
('c6','c++');

SELECT * FROM courses;


USE maneesh_db;
CREATE TABLE enrolment(
enrolment_id VARCHAR(100) NOT NULL,
student_id VARCHAR(10) NOT NULL,
course_id VARCHAR(10) NOT NULL,
PRIMARY KEY(enrolment_id),
FOREIGN KEY(student_id) REFERENCES student(student_id),
FOREIGN KEY(course_id) REFERENCES courses(course_id)
);

INSERT INTO enrolment
VALUES
('e1','s1','c1'),
('e2','s7','c4'),
('e3','s6','c2'),
('e4','s5','c1'),
('e5','s4','c5'),
('e6','s1','c4'),
('e7','s2','c6'),
('e8','s3','c5'),
('e9','s2','c4'),
('e10','s4','c3'),
('e11','s2','c2'),
('e12','s7','c6');

SELECT * FROM enrolment;

/* SQL JOINS */
CREATE DATABASE maneesh_2;
USE maneesh_2;
CREATE TABLE country(
country_code VARCHAR(10) NOT NULL,
country_name VARCHAR(100),
PRIMARY KEY(country_code)
);

INSERT INTO country
VALUES
('IN','India'),
('SL','Srilanka'),
('PK','Pakistan'),
('BN','Bangladesh'),
('NP','Nepal');

USE maneesh_2;
SELECT * FROM country;


USE maneesh_2;
CREATE TABLE capital(
capital_id VARCHAR(10) NOT NULL,
country_code VARCHAR(10),
capital_name VARCHAR(100),
PRIMARY KEY(capital_id),
FOREIGN KEY(country_code) REFERENCES country(country_code)
);

INSERT INTO capital
VALUES
('C1','IN','New Delhi'),
('C2','PK','Islamabad'),
('C3','NP','Kathmamdu');

SELECT * FROM capital;

/* INNER JOIN */
SELECT * FROM country INNER JOIN capital ON country.country_code=capital.country_code;
-- selecting specified field
SELECT country.country_name,capital.capital_name FROM country INNER JOIN capital ON country.country_code=capital.country_code;

/* LEFT JOIN */
SELECT * FROM country LEFT JOIN capital ON country.country_code=capital.country_code;

/* RIGHT JOIN */
SELECT * FROM country RIGHT JOIN capital ON country.country_code=capital.country_code;

/* FULL  JOIN */
SELECT * FROM country LEFT JOIN capital ON country.country_code=capital.country_code
 UNION
SELECT * FROM country RIGHT JOIN capital ON country.country_code=capital.country_code;


/* IF FUNCTION */
SELECT if(10>20,"true","false") AS result;

-- if function in table
USE maneesh_db;
SELECT student_name,age, if(age>=18,"Adult","Minor") AS student_type FROM student;

/* IFNULL FUNCTION */
SELECT ifnull(null,"hello") AS result;

SELECT ifnull(2,"hello") AS result;

-- ifnull
USE maneesh_2;
SELECT country.country_name,ifnull(capital.capital_name,"Not Defined") As capital_name FROM
country LEFT JOIN capital ON country.country_code=capital.country_code;

/* ISNULL FUNCTION */
SELECT isnull(null) AS result;

SELECT isnull(2) AS result;

-- isnull used in maneesh_2
USE maneesh_2; 
SELECT country.country_name,isnull(capital.capital_name) As capital_name FROM
country LEFT JOIN capital ON country.country_code=capital.country_code;

/* CASE FUNCTION */
USE maneesh_2;
SELECT country_name,
	   CASE
		   WHEN country_name = "India" THEN "Hindi"
		   WHEN country_name = "Pakistan" THEN "Urdu"
		   WHEN country_name = "Nepal" THEN "Nepali"
	       WHEN country_name = "Srilanka" THEN "Sinhala"
		   ELSE "Bengali"
        END AS official_lang 
FROM country;








