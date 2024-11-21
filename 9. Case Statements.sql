-- Case statements --

Select first_name, 
last_name,
age,
CASE 
	WHEN AGE <= 30 Then 'Young' 
    When age between 31 and 50 THEN 'old'
    When age >= 50 THEN 'On Deaths Door'
End as Age_Bracket
from employee_demographics;

-- Pay Increase and Bonus --
-- < 50000 = %5
-- > 50000 = %7
-- Finance = %10 Bonus

Select first_name, last_name, salary,
Case
	When salary > 50000 then salary * 1.07
    When salary < 50000 then salary * 1.05
END AS New_Salary,
Case 
	When dept_id = 6 then salary * .10
END
from employee_salary;

Select *
from employee_salary;

Select *
from parks_departments;
;


