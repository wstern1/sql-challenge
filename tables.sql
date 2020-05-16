CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

CREATE TABLE dept_emp (
	emp_no VARCHAR,
	dept_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE employees (
	emp_no VARCHAR PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(titles_id)
);

CREATE TABLE salaries (
	emp_no VARCHAR,
	salary VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE titles (
	titles_id VARCHAR PRIMARY KEY,
	title VARCHAR
);