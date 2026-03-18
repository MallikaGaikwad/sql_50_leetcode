# Write your MySQL query statement below
select employee_id, department_id
from employee
where primary_flag  = "Y"
Union
select employee_id, department_id
from employee
Group by employee_id
having count(department_id) = 1 
order by employee_id
