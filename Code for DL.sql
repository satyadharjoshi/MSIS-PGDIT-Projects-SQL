CREATE TABLE employees (
 
emp_id int NOT NULL,
emp_name varchar(45) DEFAULT NULL,
mng_id int DEFAULT NULL,
PRIMARY KEY (emp_id)
)


INSERT INTO employees (emp_id,emp_name,mng_id) VALUES (1,'Joe','2');
INSERT INTO employees (emp_id,emp_name,mng_id) VALUES (2,'Green',NULL);
INSERT INTO employees (emp_id,emp_name,mng_id) VALUES (3,'Jen','2');
INSERT INTO employees (emp_id,emp_name,mng_id) VALUES (4,'Brown','1');
INSERT INTO employees (emp_id,emp_name,mng_id) VALUES (5,'Harry','1');
INSERT INTO employees (emp_id,emp_name,mng_id) VALUES (6,'Jenny','4');

SELECT 
--DISTINCT 
e.emp_id AS 'mng_id', e.emp_name AS 'mng_name'
FROM employees e, employees m WHERE e.emp_id = m.mng_id

select e.emp_id AS mngid, e.emp_name


