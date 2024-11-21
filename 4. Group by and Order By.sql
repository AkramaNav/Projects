-- Group By

select * 
From parks_and_recreation.employee_demographics;


select gender, AVG(age)
From parks_and_recreation.employee_demographics
Group By gender
;

select occupation, salary 
From parks_and_recreation.employee_salary
Group By occupation, salary
;

select gender, AVG(age), MAX(age), MIN(age), COUNT(age)
From parks_and_recreation.employee_demographics
Group By gender
;

-- Order By -- 

select *
From parks_and_recreation.employee_demographics
order by gender desc, age 
;
-- Avoid doing this --
select *
From parks_and_recreation.employee_demographics
order by 5, 4 asc
;