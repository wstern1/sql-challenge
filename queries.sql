--1.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON e.emp_no=s.emp_no;

--2.
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

--3.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments d
INNER JOIN dept_manager dm ON d.dept_no = dm.dept_no
INNER JOIN employees e ON e.emp_no = dm.emp_no;

--4.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e 
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no;

--5.
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6.
WITH dept_cte AS (
	SELECT d.dept_no, d.dept_name
	FROM departments d
	WHERE d.dept_name = 'Sales'
),
deptemp_cte AS (
	SELECT de.emp_no, dc.dept_name
	FROM dept_emp de
		JOIN dept_cte dc ON de.dept_no = dc.dept_no
)
SELECT e.emp_no, e.last_name, e.first_name, dtc.dept_name
FROM employees e 
	JOIN deptemp_cte dtc ON e.emp_no = dtc.emp_no;
	
--7.
WITH dept_cte AS (
	SELECT d.dept_no, d.dept_name
	FROM departments d
	WHERE d.dept_name = 'Sales'
),
deptemp_cte AS (
	SELECT de.emp_no, dc.dept_name
	FROM dept_emp de
		JOIN dept_cte dc ON de.dept_no = dc.dept_no
),
dev_dept_cte AS (
	SELECT d.dept_no, d.dept_name
	FROM departments d
	WHERE d.dept_name = 'Development'
),
dev_deptemp_cte AS (
	SELECT de.emp_no, ddc.dept_name
	FROM dept_emp de
		JOIN dev_dept_cte ddc ON de.dept_no = ddc.dept_no
)
SELECT e.emp_no, e.last_name, e.first_name, dtc.dept_name
FROM employees e 
	JOIN deptemp_cte dtc ON e.emp_no = dtc.emp_no
UNION ALL 
SELECT e.emp_no, e.last_name, e.first_name, ddtc.dept_name
FROM employees e 
	JOIN dev_deptemp_cte ddtc ON e.emp_no = ddtc.emp_no;
	
--8.
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;
