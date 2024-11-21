-- Temporary Tables -- Tables that are only visable in the session we created them in (storing intermediate results before using in a permanent table)

Create Temporary Table temp_table
(first_name varchar(50),
last_name varchar(50),
favourite_movie varchar(100)
);

Select * 
From temp_table;

Insert INTO temp_table
Values ('Akrama', 'Naveed', 'Captain America Winter Soldier');

Select * 
From temp_table;

Select *
from employee_salary;

Create Temporary Table salary_over_50k
Select * 
From employee_salary
Where salary >= 50000;

Select *
from salary_over_50k;