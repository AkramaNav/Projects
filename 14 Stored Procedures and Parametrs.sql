-- Stored Procedures -- Way to save the sql code to simply repetitive code

Select * 
from employee_salary 
Where salary >= 50000
;

Create Procedure large_salaies() -- The parentheses () indicate that the stored procedure takes no parameters -- 
Select * 
from employee_salary 
Where salary >= 50000
;

Call large_salaies();

Delimiter $$ 
Create Procedure large_salaies3()  
Begin
	Select * 
	from employee_salary 
	Where salary >= 50000;
	Select * 
	from employee_salary 
	Where salary >= 10000;
End $$
Delimiter ;

Call large_salaies3();

-- Parameter--  Variables that are passed a input into the procedure to then be used in the code later

Delimiter $$ 
Create Procedure large_salaries6(p_emp_id INT)  
Begin
	Select salary
	from employee_salary
    WHERE employee_id = p_emp_id
    ;
End $$
Delimiter ;

Call large_salaries6(1)


