--create table for titles
Create table titles(
	title_id varchar (10) NOT NULL PRIMARY KEY,
	title VARCHAR (30)
); 	
select * from titles

-- create table for employees
CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title VARCHAR NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles (title_id),
	birth_date date NOT NULL, 
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	Primary key (emp_no)
);
select * from employees

--create table for departments
Create table departments(
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(30)
);
select * from departments

-- create table for department employees
CREATE TABLE dept_emp
(
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
select * from dept_emp

-- create table for department managers
CREATE TABLE dept_manager(
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, dept_no)
);	
select * from dept_manager

-- create table for employee salaries
CREATE TABLE salaries 
(
	emp_no int,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	salary int
);
select * from salaries