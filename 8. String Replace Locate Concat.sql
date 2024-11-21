-- String functions --

Select length ('skyfall');

select first_name, Length(first_name)
from employee_demographics
Order by 2
;

Select Upper('sky');
Select Lower('SKY');

select first_name, upper(first_name)
from employee_demographics
Order by first_name asc
;

-- Trim -- Remove the white space

select Ltrim('    sky     ')
;

select Rtrim('             sky             ')
;

-- Subtring -- 

Select first_name, 
left(first_name, 4),
RIGHT(first_name, 4),
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2) AS Birth_Month
from employee_demographics;

-- Replace -- replaces x with y 

Select first_name, Replace(first_name, 'a', 'z')
from employee_demographics;

-- Locate --
Select first_name, Locate('an', first_name)
from employee_demographics;

-- Concat -- combine two things

Select first_name, last_name,
Concat(first_name,' ', last_name) as full_name
from employee_demographics;



