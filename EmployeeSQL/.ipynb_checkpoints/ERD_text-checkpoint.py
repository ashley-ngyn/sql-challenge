# coding/text from https://app.quickdatabasediagrams.com/#/


departments
-
dept_no VARCHAR(10) pk
dept_name VARCHAR(30)


dept_emp
-
emp_no INT FK >- employees.emp_no
dept_no VARCHAR(10) FK >- departments.dept_no


dept_manager
-
dept_no VARCHAR(10) FK >- departments.dept_no
emp_no INT FK >- employees.emp_no


employees
-
emp_no INT pk FK >- salaries.emp_no
emp_title_id VARCHAR(10)
birth_date VARCHAR(12)
first_name VARCHAR(30)
last_name VARCHAR(30)
sex VARCHAR(1)
hire_date VARCHAR(12)


salaries
-
emp_no INT
salary INT


titles
-
title_id VARCHAR(10) pk FK >- employees.emp_title_id
title VARCHAR(30)