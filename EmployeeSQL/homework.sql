select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
join salaries as s on
e.emp_no=s.emp_no
;

select e.first_name, e.last_name, e.hire_date
from employees as e
where e.hire_date between '1986-01-01' and '1986-12-31'
order by e.hire_date asc
;

select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from dept_manager as dm
join departments as d 
	on d.dept_no=dm.dept_no
join employees as e 
	on dm.emp_no=e.emp_no
;

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de
	on de.emp_no=e.emp_no
join departments as d
	on d.dept_no=de.dept_no
;

select e.first_name, e.last_name, e.sex
from employees as e
where e.first_name = 'Hercules' and e.last_name like 'B%'
;

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de
	on e.emp_no=de.emp_no
join departments as d
	on de.dept_no=d.dept_no
where d.dept_name = 'Sales'
;


select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de
	on e.emp_no=de.emp_no
join departments as d
	on de.dept_no=d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'
;

select e.last_name, count(*) as "Number_of_EE"
from employees as e 
group by e.last_name
;