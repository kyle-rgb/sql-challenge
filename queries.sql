
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" as e
JOIN "Salaries" as s
ON s.emp_no = e.emp_no;

SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


SELECT departed.dept_no, departed.dept_name, departed.emp_no, e.last_name, e.first_name
FROM "Employees" AS e
INNER JOIN 
(SELECT d.dept_no, d.dept_name, dm.emp_no
FROM "Departments" as d
JOIN "Dept_Manager" as dm
ON d.dept_no = dm.dept_no) AS departed
ON e.emp_no = departed.emp_no;

SELECT e.emp_no, e.last_name, e.first_name, departed.dept_name
FROM "Employees" as e
INNER JOIN
(SELECT *
FROM "Departments" as d
JOIN "Dept_Emp" as em
ON d.dept_no = em.dept_no) AS departed
ON e.emp_no = departed.emp_no;

SELECT first_name, last_name, sex 
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT departed.emp_no, e.last_name, e.first_name, departed.dept_name
FROM "Employees" AS e
INNER JOIN 
(SELECT *
 FROM 
(SELECT d.dept_no, d.dept_name
FROM "Departments" as d WHERE d.dept_name = 'Sales') as d
JOIN "Dept_Emp" as dm
ON d.dept_no = dm.dept_no) AS departed
ON e.emp_no = departed.emp_no;

SELECT departed.emp_no, e.last_name, e.first_name, departed.dept_name
FROM "Employees" AS e
INNER JOIN 
(SELECT *
 FROM 
(SELECT d.dept_no, d.dept_name
FROM "Departments" as d WHERE d.dept_name = 'Development' OR d.dept_name = 'Sales') as d
JOIN "Dept_Emp" as dm
ON d.dept_no = dm.dept_no) AS departed
ON e.emp_no = departed.emp_no;

SELECT last_name, COUNT(last_name) as counts
FROM "Employees" as e
GROUP BY last_name
ORDER BY counts DESC;

SELECT departed.dept_name, COUNT(e.emp_no)
FROM "Employees" as e
INNER JOIN
(SELECT *
FROM "Departments" as d
JOIN "Dept_Emp" as em
ON d.dept_no = em.dept_no) AS departed
ON e.emp_no = departed.emp_no
GROUP BY departed.dept_name;














