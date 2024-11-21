-- Where Clause --

Select *
From employee_salary
Where first_name = 'Leslie'
;

Select *
From employee_salary
Where salary <= 50000
;

Select *
From employee_demographics
Where birth_date > '1985-01-01'
;

-- Logical Operations are AND or NOT -- 

Select *
From employee_demographics
Where birth_date > '1985-01-01'
OR NOT gender = 'male'
;

Select *
From employee_demographics
Where (first_name = 'Leslie' AND age = 44) OR age > 55
;

-- Like Statement -- Can use things like % or _ 
Select *
From employee_demographics
Where first_name LIKE 'a__%'
;

Select *
From employee_demographics
Where birth_date LIKE '1989%'
;