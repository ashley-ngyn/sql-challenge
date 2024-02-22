-- drop any existing tables
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- create tables with primary keys first
-- source 01 create tables with composite keys

create table departments (
	"dept_no" VARCHAR(10) NOT NULL,
	"dept_name" VARCHAR(30) NOT NULL,
	constraint "pk_departments" primary key(dept_no)
);

create table employees (
	"emp_no" INT NOT NULL,
	"emp_title_id" VARCHAR(10) NOT NULL,
	"birth_date" VARCHAR(12) NOT NULL,
	"first_name" VARCHAR(30) NOT NULL,
	"last_name" VARCHAR(30) NOT NULL,
	"sex" VARCHAR(1) NOT NULL,
	"hire_date" VARCHAR(12) NOT NULL,
	constraint "pk_employees" primary key(emp_no)
);
	
create table titles (
	"title_id" VARCHAR(10) NOT NULL,
	"title" VARCHAR(30) NOT NULL,
	constraint "pk_titles" primary key(title_id)
);
	
	
-- tables with no foreign keys
	
create table dept_manager (
	"dept_no" VARCHAR(10) NOT NULL,
	"emp_no" INT NOT NULL
);

create table dept_emp (
	"emp_no" INT NOT NULL,
	"dept_no" VARCHAR(10) NOT NULL
);

create table salaries (
	"emp_no" INT NOT NULL,
	"salary" INT NOT NULL
);

-- source 01 to alter tables to create composite keys
-- this helps differentiate primary and foreign keys
alter table dept_emp
	add constraint "fk_dept_emp_emp_no" foreign key(emp_no)
	references employees(emp_no);

alter table dept_emp
	add constraint "fk_dept_emp_dept_no" foreign key(dept_no)
	references departments(dept_no);

alter table dept_manager
	add constraint "fk_dept_manager_dept_no" foreign key(dept_no)
	references departments(dept_no);

alter table dept_manager
	add constraint "fk_dept_manager_emp_no" foreign key(emp_no)
	references employees(emp_no);

alter table salaries
	add constraint "fk_salaries_emp_no" foreign key(emp_no)
	references employees(emp_no);

alter table employees
	add constraint "fk_employees_emp_title_id" foreign key(emp_title_id)
	references titles(title_id);


-- import csv files into tables
-- query all from each table to check if imported correctly
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;