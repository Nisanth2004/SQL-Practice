

--  COPY tables in SQL


/*
CREATE TABLE table_name AS
SELECT *
FROM table_name;
*/

USE first;

-- COPYING TABLE STRUCTURE WITH DATA
CREATE TABLE customer_with_data AS
SELECT *
FROM customer_dummy;

-- COPYING STRUCTURE ONLY
CREATE TABLE customer_structure LIKE customer_dummy;
DESC customer_structure;

-- COPYING SPECIFIC ROWS
CREATE TABLE customer_with_data_1 AS
SELECT *
FROM customer_dummy
WHERE id = 1;

-- COPYING SPECIFIC COLUMNS
CREATE TABLE customer_with_data_11 AS
SELECT id
FROM customer_dummy
WHERE id = 1;

-- COPYING TABLE FROM ANOTHER DATABASE
CREATE TABLE customer_copy AS
SELECT *
FROM quantum_tutors.customers;


-- --------------------------------------------------

# ALTER statements

/*
Alter table uses:
1. Adding Columns
2. Modifying columns
3. Dropping columns
4. Adding constraints
5. Renaming Tables
*/

-- COPYING TABLE STRUCTURE WITH DATA
CREATE TABLE customer_copy AS
SELECT *
FROM customers;

desc customer_copy;

-- ADDING COLUMN
ALTER TABLE customer_copy
ADD profile_picture VARCHAR(255);

-- ADDING COLUMN WITHOUT DATATYPE
ALTER TABLE customer_copy
ADD profile_picture_1;-- error (datatype want to mention)

-- ADDING COLUMN WITH CONSTRAINT
ALTER TABLE customer_copy
ADD profile_picture_constraint VARCHAR(255) NOT NULL;


-- ADDING COLUMN WITH ORDER
ALTER TABLE customer_copy
ADD profile_picture_order1 VARCHAR(255) AFTER country;

ALTER TABLE customer_copy
ADD profile_picture_order2 VARCHAR(255) FIRST;

-- ------------------------------------------------------------

# Add a course duration in courses table

ALTER TABLE COURSES ADD COURSE_DURATION INT;

-- ALTER to DROP column

USE first;

ALTER TABLE customer_copy
DROP COLUMN profile_picture_constraint;

DESC customer_copy;

ALTER TABLE customer_copy
DROP COLUMN profile_picture_order1,
DROP COLUMN profile_picture_order2;

-- ALTER to modify the Column

-- MODIFY DATATYPE

desc customer_copy;
alter table customer_copy
modify column contact_number varchar(20);


-- MODIFY CONTRAINT
alter table customer_copy
modify column contact_number varchar(20)  NULL;


-- MODIFY MULTIPLE COLUMNS AT ONCE

alter table customer_copy
modify column contact_number varchar(20)  NULL,
modify column first_name varchar(200)  NULL
;

-- --------------------------------------------------------------

# DROP the foreign keys

drop table customers;
/*

ERROR:
18:52:37	drop table customers	Error Code: 3730. Cannot drop table 'customers'
 referenced by a foreign key constraint 'enrollments_ibfk_1' on table 'enrollments'.	0.0013 sec
*/


# TRUNCATE COMMANDS

-- delete the data only
USE qt_test;

/*
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE table_name;

SET FOREIGN_KEY_CHECKS = 1;
*/

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE customers;

SET FOREIGN_KEY_CHECKS = 1;

/*
ALTER TABLE related_table 
DROP FOREIGN KEY fk_name;

TRUNCATE TABLE table_name;

ALTER TABLE related_table 
ADD CONSTRAINT fk_name FOREIGN KEY (fk_column) 
	REFERENCES table_name(pk_column);

SELECT CONSTRAINT_NAME 
FROM information_schema.KEY_COLUMN_USAGE 
WHERE TABLE_SCHEMA = 'your_database_name' 
AND TABLE_NAME = 'related_table' 
AND REFERENCED_TABLE_NAME = 'table_name';
*/

ALTER TABLE courses 
DROP FOREIGN KEY courses_ibfk_1;

-- Error Code: 1701. Cannot truncate a table referenced in a 
-- foreign key constraint (`qt_test`.`courses`, CONSTRAINT 
-- `courses_ibfk_1`)


TRUNCATE TABLE instructors;

ALTER TABLE courses 
ADD CONSTRAINT courses_ibfk_1 FOREIGN KEY (instructor_id) 
	REFERENCES instructors(instructor_id);
    

SELECT CONSTRAINT_NAME 
FROM information_schema.KEY_COLUMN_USAGE 
WHERE TABLE_SCHEMA = 'qt_test' 
AND TABLE_NAME = 'courses' 
AND REFERENCED_TABLE_NAME = 'instructors';


