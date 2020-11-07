--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
  FROM "Employees" as e
  JOIN "Salaries" as s
	ON e.emp_no = s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.emp_no, 
	   e.last_name, 
	   e.first_name, 
 	   e.hire_date
  FROM "Employees" as e
 WHERE e.hire_date between '1986-01-01' and '1986-12-31'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no,
	   d.dept_name,
	   dm.emp_no,
	   e.last_name,
	   e.first_name
  FROM "Departments" as d
  JOIN "Department_Manager" as dm
    ON d.dept_no = dm.dept_no
  JOIN "Employees" as e
	ON dm.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
   FROM "Employees" as e
   JOIN "Department_Employee" as de
     ON e.emp_no = de.emp_no
   JOIN "Departments" as d
	 ON de.dept_no = d.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT *
   FROM "Employees" 
  WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';
	
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
   FROM "Employees" as e
   JOIN "Department_Employee" as de
     ON e.emp_no = de.emp_no
   JOIN "Departments" as d
	 ON de.dept_no = d.dept_no
  WHERE d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
   FROM "Employees" as e
   JOIN "Department_Employee" as de
     ON e.emp_no = de.emp_no
   JOIN "Departments" as d
	 ON de.dept_no = d.dept_no
  WHERE d.dept_name = 'Sales' or d.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as "last_name_frequency"
  FROM "Employees" as e
 GROUP BY last_name
 ORDER BY "last_name_frequency" DESC;