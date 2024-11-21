-- Window Functions -- 

Select gender, AVG(salary) As avg_salary
from employee_demographics as dem 
Join employee_salary as SAL
	On dem.employee_id = sal.employee_id
group by gender;

-- Purpose of this window funciton is for aditional information --

Select dem.first_name, dem.last_name, gender, AVG(salary) OVER(partition by gender)
from employee_demographics as dem 
Join employee_salary as SAL
	On dem.employee_id = sal.employee_id; 
    
-- Rolling total, adds the last persons sum to get new toatl -- Partitioned by Gender -- 
    
Select dem.first_name, dem.last_name, gender, salary,
sum(salary) OVER(partition by gender order by dem.employee_id) AS Rolling_total
from employee_demographics as dem 
Join employee_salary as SAL
	On dem.employee_id = sal.employee_id; 
    
    
Select dem.employee_id, dem.first_name, dem.last_name, gender, salary,
Row_number() OVER(PARTITION BY gender order by salary desc) as row_num, -- own unique in its partition -- 
RANK() OVER(PARTITION BY gender order by salary desc) as rank_num, -- Gives next number postionally -- 
dense_RANK() OVER(PARTITION BY gender order by salary desc) as dense_rank_num -- Gives next number numerically -- 
from employee_demographics as dem 
Join employee_salary as SAL
	On dem.employee_id = sal.employee_id; 

