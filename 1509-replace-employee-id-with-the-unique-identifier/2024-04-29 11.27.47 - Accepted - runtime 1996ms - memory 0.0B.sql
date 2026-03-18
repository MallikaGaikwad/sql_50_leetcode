# Write your MySQL query statement below
select eu.unique_id,
    e.name
from employees e
left Join employeeuni eu
on e.id = eu.id