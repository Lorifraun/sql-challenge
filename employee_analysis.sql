-- review the data
SELECT COUNT (*) as count from employees;

SELECT COUNT (*) as count, emp_no from dept_emp
group by emp_no having count (*)>1

--List the following details of each employee: employee number, last name, first name, sex, and salary.

Select 
e.emp_no,
e.last_name,
e.first_name,
e.sex,
s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT
first_name,
last_name,
hire_date
FROM employees
where hire_date <'1/1/1986'
AND hire_date >'12/31/1986';

-- List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.

SELECT
d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_manager m ON m.dept_no=d.dept_no
JOIN employees e ON e.emp_no=m.emp_no

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT
e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON de.emp_no=e.emp_no
JOIN departments d ON d.dept_no= de.dept_no

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT
first_name, last_name, sex
FROM employees
WHERE first_name='Hercules'
AND last_name like 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT
e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON de.emp_no=e.emp_no
JOIN departments d ON d.dept_no= de.dept_no
WHERE d.dept_name ='Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON de.emp_no=e.emp_no
JOIN departments d ON d.dept_no= de.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT COUNT (last_name) as count, last_name
from employees
GROUP BY last_name
ORDER BY last_name DESC