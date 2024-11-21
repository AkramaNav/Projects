-- Limit & Aliasing -- 

Select * 
From parks_and_recreation.employee_demographics
order by age desc
Limit 2, 1
;


-- Aliasing -- 

Select gender, AVG(age) as avg_age
From employee_demographics
group by gender
Having avg_age > 40
;
