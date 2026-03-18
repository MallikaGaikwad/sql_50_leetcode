# Write your MySQL query statement below

select e3.employee_id
from employees e1
join employees e2
join employees e3
on e3.manager_id = e2.employee_id 
on e2.manager_id = e1.employee_id
and e1.manager_id = 1 and e3.employee_id <> 1
