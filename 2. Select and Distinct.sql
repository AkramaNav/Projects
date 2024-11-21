SELECT * 
from parks_and_recreation.employee_demographics;

SELECT first_name, 
last_name, 
birth_date,
age,
(age + 10) * 10 + 10
from parks_and_recreation.employee_demographics;
# PEMDAS Parentheses, Exponent, Multiplication, Division, Addition, Subtraction

SELECT distinct first_name, gender 
from parks_and_recreation.employee_demographics;

SELECT *
from employee_salary;

SELECT first_name,
occupation, 
salary
from parks_and_recreation.employee_salary;


