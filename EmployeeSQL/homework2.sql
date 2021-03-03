--  CREATE TABLE titles(
--  	title_id varchar primary key NOT NULL,
--  	title varchar NOT NULL);

-- CREATE TABLE departments(
--   	dept_no varchar NOT NULL,
--   	dept_name varchar NOT NULL,
--  	primary key (dept_no));

-- CREATE TABLE employees(
--  	emp_no int NOT NULL,
--  	emp_title varchar NOT NULL,
--  	birth_date date NOT NULL,
--  	first_name varchar NOT NULL,
--  	last_name varchar NOT NULL, 
--  	sex varchar NOT NULL,
--  	hire_date date NOT NULL,
--  	primary key(emp_no),
--  	constraint fk_titles
--  		foreign key (emp_title)
--  			references titles(title_id));
-- CREATE TABLE salaries(
--    	emp_no int NOT NULL,
--    	salary int NOT NULL,
--  	primary key (emp_no),
--  	constraint fk_employees
--  		foreign key (emp_no)
--  			references employees(emp_no));
-- CREATE TABLE dept_man(
--  	dept_no varchar NOT NULL,
--   	emp_no int NOT NULL,
--  	primary key (emp_no),
--  	constraint fk_employees
--  		foreign key (emp_no)
--  			references employees(emp_no),
--  	constraint fk_departments
--  		foreign key (dept_no)
--  			references departments(dept_no));

-- CREATE TABLE dept_emp(
-- 	emp_no int NOT NULL,
--  	dept_no varchar NOT NULL,
-- 	constraint pk_dept_emp 
-- 		primary key (emp_no, dept_no),
--  	constraint fk_employees
--  		foreign key (emp_no)
--  			references employees(emp_no),
--  	constraint fk_departments
--  		foreign key (dept_no)
--  			references departments(dept_no));	

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
join salaries as s on
e.emp_no=s.emp_no
;

select e.first_name, e.last_name, e.hire_date
from employees as e
where e.hire_date between '1986-01-01' and '1986-12-31'
order by e.hire_date;

select dm.dept_no, d.dept_name, e.last_name, e.first_name
from dept_man as dm, departments as d, employees as e
where dm.dept_no = d.dept_no 
and dm.emp_no = e.emp_no
order by 1;

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e, departments as d, dept_emp as de
where e.emp_no = de.emp_no and de.dept_no = d.dept_no
order by 1;

select e.first_name, e.last_name, e.sex
from employees as e
where e.first_name='Hercules' and e.last_name like 'B%'
order by 2;

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e, departments as d, dept_emp as de
where e.emp_no=de.emp_no and de.dept_no=d.dept_no
and d.dept_name = 'Sales'
order by 1;

--create view sales_employee as
--select d.dept_name, de.emp_no
--from departments as d, dept_emp as de
--where d.dept_no=de.dept_no and d.dept_name='Sales';

select e.emp_no, e.last_name, e.first_name, sales_employee.dept_name
from employees as e, sales_employee
where e.emp_no = sales_employee.emp_no
order by 1;

create view sales_dev_employee as
select d.dept_name, de.emp_no
from departments as d, dept_emp as de
where d.dept_no=de.dept_no and d.dept_name='Sales' or d.dept_name='Development';

select e.emp_no, e.last_name, e.first_name, sales_dev_employee.dept_name
from employees as e, sales_dev_employee
where e.emp_no = sales_dev_employee.emp_no
order by 4, 1;

select e.last_name, count(e.last_name)
from employees as e
group by e.last_name
order by e.last_name desc;