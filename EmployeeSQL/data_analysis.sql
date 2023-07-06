--List the employee number, last name, first name, sex, and salary of each employee.
select emp_no, last_name, first_name, sex, 
(select salary
from salaries as s
where e.emp_no = s.emp_no)
From employees as e
limit 50;

--List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date like '%1986'
limit 50;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dm.emp_no, e.first_name, e.last_name, dm.dept_no, d.dept_name
from dept_manager as dm
left join employees as e
on (dm.emp_no = e.emp_no)
left join departments as d
on (dm.dept_no = d.dept_no);

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select e.emp_no, last_name, first_name, de.dept_no, d.dept_name
from employees as e
left join dept_emp as de
on (de.emp_no = e.emp_no)
left join departments as d
on (d.dept_no = de.dept_no)
limit 50;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select last_name, first_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
select e.emp_no, e.last_name, e.first_name, de.dept_no
from dept_emp as de
join employees as e
on (e.emp_no = de.emp_no)
join departments as d
on (d.dept_no = de.dept_no)
where dept_name = 'Sales'
limit 50;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
join employees as e
on (e.emp_no = de.emp_no)
join departments as d
on (d.dept_no = de.dept_no)
where dept_name = 'Sales' or dept_name = 'Development'
limit 50;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select  last_name, COUNT(last_name) as "Same Last Name Count"
from employees
group by last_name
order by "Same Last Name Count" DESC
limit 50;


