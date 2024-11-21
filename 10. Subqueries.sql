-- Sub Queries --

Select *
from employee_demographics
Where employee_id IN 
		(Select employee_id
			From employee_salary
			Where dept_id = 1)
;

Select first_name, salary,
(Select AVG(salary)
From employee_salary)
from employee_salary; 

Select gender, AVG(age), MAX(age), MIN(age), Count(age)
from employee_demographics
group by gender;
;

Select AVG(max_age)
from
(Select gender, 
AVG(age) as avg_age, 
MAX(age) as max_age, 
MIN(age) as min_age, 
Count(age) as cnt_age
from employee_demographics
group by gender) as Agg_table
;
