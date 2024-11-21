-- Having and Where --

Select gender, AVG (age)
From parks_and_recreation.employee_demographics
group by gender
Having AVG(age) > 40
;

Select occupation, AVG(salary)
From parks_and_recreation.employee_salary
Where occupation Like '%manager%'
group by occupation
Having AVG(salary) > 50000
;