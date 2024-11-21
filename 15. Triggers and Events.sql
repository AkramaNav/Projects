-- Triggers and Events -- is a block of code that auto runs based on data

Select *
From employee_demographics;

Select *
From employee_salary;


Delimiter $$
Create Trigger Employee_Insert
	After Insert ON employee_salary -- can use before for deleting -- 
    FOR EACH ROW
Begin
	Insert into employee_demographics (employee_id, first_name, last_name)
	Values (NEW.employee_id, NEW.first_name, NEW.last_name); -- means new rows inserted can also be done for OLD -- 
END $$
Delimiter ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
Values (13,  'Akrama-Naveed', ' Muhammad', 'Gamer', '100000' , null);


-- Events -- A Scheuled Automater Very useful for automation

Select * 
from employee_demographics;


Delimiter $$
Create EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO 
Begin
	Delete
    From employee_demographics
	Where age >= 60;
END $$
Delimiter ; 

SHOW VARIABLES LIKE 'event%';


