--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
join salaries as s on
e.emp_no=s.emp_no
;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select e.first_name, e.last_name, e.hire_date
from employees as e
where e.hire_date between '1986-01-01' and '1986-12-31'
order by e.hire_date;

--3. List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
select dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
from dept_manager as dm, departments as d, employees as e
where dm.dept_no = d.dept_no 
and dm.emp_no = e.emp_no
order by 1;

--4. List the department of each employee with the following information: employee number, 
--	last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e, departments as d, dept_emp as de
where e.emp_no = de.emp_no and de.dept_no = d.dept_no
order by 1;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select e.first_name, e.last_name, e.sex
from employees as e
where e.first_name='Hercules' and e.last_name like 'B%'
order by 2;

--6. List all employees in the Sales department, including their employee number, last name, 
--	first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e, departments as d, dept_emp as de
where e.emp_no=de.emp_no and de.dept_no=d.dept_no
and d.dept_name = 'Sales'
order by 1;

--7. List all employees in the Sales and Development departments, including their employee number, 
--	last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e, departments as d, dept_emp as de
where e.emp_no=de.emp_no and de.dept_no=d.dept_no
and d.dept_name = 'Sales'

UNION

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e, departments as d, dept_emp as de
where e.emp_no=de.emp_no and de.dept_no=d.dept_no
and d.dept_name = 'Development'
order by 4, 1;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select e.last_name, count(e.last_name)
from employees as e
group by e.last_name
order by e.last_name desc;