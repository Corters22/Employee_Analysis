CREATE TABLE titles(
  	title_id varchar primary key NOT NULL,
  	title varchar NOT NULL);

CREATE TABLE departments(
   	dept_no varchar NOT NULL,
   	dept_name varchar NOT NULL,
  	primary key (dept_no));

CREATE TABLE employees(
 	emp_no int NOT NULL,
  	emp_title varchar NOT NULL,
  	birth_date date NOT NULL,
  	first_name varchar NOT NULL,
  	last_name varchar NOT NULL, 
  	sex varchar NOT NULL,
  	hire_date date NOT NULL,
  	primary key(emp_no),
  	constraint fk_titles
  		foreign key (emp_title)
  			references titles(title_id));
CREATE TABLE salaries(
    	emp_no int NOT NULL,
    	salary int NOT NULL,
  	primary key (emp_no),
  	constraint fk_employees
  		foreign key (emp_no)
  			references employees(emp_no));
CREATE TABLE dept_man(
  	dept_no varchar NOT NULL,
   	emp_no int NOT NULL,
  	primary key (emp_no),
  	constraint fk_employees
  		foreign key (emp_no)
  			references employees(emp_no),
  	constraint fk_departments
  		foreign key (dept_no)
  			references departments(dept_no));

CREATE TABLE dept_emp(
 	emp_no int NOT NULL,
  	dept_no varchar NOT NULL,
 	constraint pk_dept_emp 
 		primary key (emp_no, dept_no),
  	constraint fk_employees
  		foreign key (emp_no)
  			references employees(emp_no),
  	constraint fk_departments
  		foreign key (dept_no)
  			references departments(dept_no));	