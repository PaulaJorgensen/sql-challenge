--Employee SQL Tables Schema

--DROP TABLE employees
--DROP TABLE departments
--DROP TABLE dept_emp
--DROP TABLE dept_manager
--DROP TABLE salaries
--DROP TABLE titles

CREATE TABLE employees (
emp_no INTEGER NOT NULL PRIMARY KEY,
birth_date DATE NOT NULL,
first_name VARCHAR (50) NOT NULL,
last_name VARCHAR (50) NOT NULL,
gender CHAR(1) NOT NULL,
hire_date DATE NOT NULL
);

SELECT * FROM employees

CREATE TABLE departments (
dept_no VARCHAR (30) NOT NULL PRIMARY KEY,
dept_name VARCHAR (50) NOT NULL
);

SELECT * FROM departments

CREATE TABLE dept_emp (
emp_no INTEGER NOT NULL,
dept_no VARCHAR (30) NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM dept_emp

CREATE TABLE dept_manager (
dept_no VARCHAR (30) NOT NULL,
emp_no INTEGER NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES	employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM dept_manager

CREATE TABLE salaries (
emp_no INTEGER NOT NULL,
salary INTEGER NOT NULL, 
from_date DATE NOT NULL,
to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES	employees(emp_no)
);

SELECT * FROM salaries

CREATE TABLE titles (
emp_no INTEGER NOT NULL,
title VARCHAR (30) NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES	employees(emp_no)
);

SELECT * FROM titles

