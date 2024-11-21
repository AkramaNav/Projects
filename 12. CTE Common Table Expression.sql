-- CTEs -- Stands for Comman Table Expression allow you to define subquery block to refrence in the main


WITH CTE_Example (Gender, AVG_Sal, Max_Sal, Min_sal, Count_Sal) as -- Use this to overwrite the ETF labels --
( 
Select gender, 
AVG(salary) avg_sal, 
Max(salary) max_sal, 
Min(salary) min_sal, 
Count(salary) count_sal
from employee_demographics as dem 
Join employee_salary as sal
	On dem.employee_id = sal.employee_id
group by gender
)
Select *
from CTE_Example
;

WITH CTE_Example as
( 
Select employee_id, gender, birth_date
from employee_demographics as dem
Where birth_date > '1985-01-01'
),
CTE_Example2 as 
(
Select employee_id, salary 
From employee_salary as sal 
Where salary > 50000
)
Select *
from CTE_Example
Join CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.Employee_id
;