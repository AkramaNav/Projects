-- Unions --

select first_name, last_name
From parks_and_recreation.employee_demographics
Union distinct
select first_name, last_name
From parks_and_recreation.employee_salary
;

select first_name, last_name
From parks_and_recreation.employee_demographics
Union all
select first_name, last_name
From parks_and_recreation.employee_salary
;

select first_name, last_name, 'OLD MAN' AS Label
From parks_and_recreation.employee_demographics
where age > 40 and gender = 'male'
Union
select first_name, last_name, 'OLD Lady' AS Label
From parks_and_recreation.employee_demographics
where age > 40 and gender = 'female'
Union
select first_name, last_name, 'Highly Payed Employee' AS Label
From parks_and_recreation.employee_salary
where salary > 70000
Order by first_name, last_name
;

