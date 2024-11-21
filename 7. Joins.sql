-- Joins -- 

Select *
From parks_and_recreation.employee_demographics;

Select *
From parks_and_recreation.employee_salary;


Select dem.employee_id, age, occupation
From parks_and_recreation.employee_demographics AS dem 
Inner Join employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Outer Joins -- Right Join takes everything from right table and matches with left table / Vice verso for LEFT 
Select *
From parks_and_recreation.employee_demographics AS dem 
Right Join employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Self Join -- 
Select emp1.employee_id as emp_santa, 
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_name, 
emp2.first_name as first_name_emp,
emp2.last_name as last_name_emp
from parks_and_recreation.employee_salary emp1
Join parks_and_recreation.employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id 
;

-- Joining Multiple Tables together -- 

Select *
From parks_and_recreation.employee_demographics AS dem 
Inner Join employee_salary AS sal
	ON dem.employee_id = sal.employee_id
Inner join parks_departments as pd
	ON sal.dept_id = pd.department_id
;

select *
from parks_departments;



