
# Data Analysis #
1. List the employee number, last name, first name, sex, and salary of each employee.

2. List the first name, last name, and hire date for the employees who were hired in 1986.

3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

6. List each employee in the Sales department, including their employee number, last name, and first name.

7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).


# Sources #

* 01 : https://www.simplilearn.com/tutorials/sql-tutorial/composite-key-in-sql#:~:text=A%20composite%20key%20in%20SQL%20can%20be%20defined%20as%20a,can%20uniquely%20identify%20any%20record.  
* 02 : data_relationships.sql
* 03 : joins_solution.sql
* 04 : https://www.w3resource.com/mysql-exercises/restricting-and-sorting-data-exercises/write-a-query-to-display-the-names-and-hire-date-for-all-employees-who-were-hired-in-1987.php
* 05 : https://www.c-sharpcorner.com/blogs/sql-query-to-find-out-the-frequency-of-each-element-in-a-column1

* source 01 - composite keys used to reference foreign keys
    
    constraint "pk_dept_no" primary key(dept_no)

    alter table dept_emp
	    add constraint "fk_dept_emp_emp_no" foreign key(emp_no)
	    references employees(emp_no);
    
* source 02 - to find relationships using join and on

    select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
    from employees as e
    join salaries as s
    on e.emp_no = s.emp_no;

* source 03 - use "as" to simplify referencing tables

    from employees as e
    join salaries as s

* source 04 - Find dates using like

    where hire_date like '%1986';

* source 05 - find frequency count

    select last_name, count(last_name) as frequency
    from employees
    group by last_name
    order by count(last_name) desc;
