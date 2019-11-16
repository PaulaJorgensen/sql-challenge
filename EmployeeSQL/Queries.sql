--Query1:  List employee details: employee #, last name, first name, gender, and salary

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM salaries
LEFT JOIN employees
ON employees.emp_no = salaries.emp_no;

--Query2: List employees who were hired in 1986

SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE Date_Part('YEAR', hire_date) = 1986;

--Query3: List Mgr of each Dept: dept no, depart name, mgr's emp no, last name, first name, start and end emp dates

SELECT dept_manager.emp_no, dept_manager.from_date, dept_manager.to_date, employees.first_name, employees.last_name, dept_manager.dept_no, departments.dept_name
FROM dept_manager
LEFT JOIN employees
ON employees.emp_no = dept_manager.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_manager.dept_no
ORDER BY employees.last_name;

--Query4: List Dept of each employee: emp no, last name, first name, and depart name

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no;

--Query5: List employees with first name of Hercules and last name begins with "B"

SELECT employees.emp_no, employees.first_name, employees.last_name
FROM employees
WHERE last_name
LIKE 'B%'
AND first_name
LIKE 'Hercules';

--Query6: List employees in Sales department, including their emp no, last name, first name, and department name

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name
LIKE 'Sales%';

--Query7: List employees in Sales and Development departments, including emp no, last name, first name, department name

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name
LIKE 'Sales%' 
OR departments.dept_name
LIKE 'Development%';

--Query8: list frequency count of employee last names in descending order

SELECT employees.last_name, COUNT(employees.emp_no) AS "Employees With Same Last Name"
FROM employees
GROUP BY employees.last_name
ORDER BY "Employees With Same Last Name" DESC;



