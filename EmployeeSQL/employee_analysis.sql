
--1.List the following details of each employee:
--employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees as e, salary as s
WHERE e.emp_no=s.emp_no
ORDER BY e.emp_no;

SELECT s.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees as e
INNER JOIN salary as s ON
e.emp_no=s.emp_no
ORDER BY e.emp_no;


--2.List employees who were hired in 1986.

SELECT e.emp_no, e.last_name, e.first_name, e.hire_date
FROM employees as e
WHERE e.hire_date like '%1986%';

--3.List the manager of each department with the following information:
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

SELECT dm.dept_no, d.dept_name,dm.emp_no, e.last_name, e.first_name, dm.from_date,dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm on
d.dept_no=dm.dept_no
INNER JOIN employees as e on
e.emp_no=dm.emp_no;

--4.List the department of each employee with the following information:
--employee number, last name, first name, and department name.

SELECT e.emp_no,e.last_name,e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees as e on
e.emp_no=de.emp_no
INNER JOIN departments as d ON
de.dept_no=d.dept_no
ORDER BY e.emp_no;

--5.List all employees whose first name is "Hercules" and last names begin with "B."

SELECT e.emp_no, e.last_name, e.first_name
FROM employees as e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

--6.List all employees in the Sales department,
--including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp ON e.emp_no=dept_emp.emp_no
INNER JOIN departments as d ON dept_emp.dept_no=d.dept_no
WHERE dept_name = 'Sales';

SELECT e.emp_no, e.last_name, e.first_name
FROM employees as e
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);
--7.List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp ON e.emp_no=dept_emp.emp_no
INNER JOIN departments as d ON dept_emp.dept_no=d.dept_no
WHERE dept_name IN ('Sales','Development');

--8.In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "last name count"
FROM employees
GROUP BY last_name
ORDER BY "last name count" DESC;

