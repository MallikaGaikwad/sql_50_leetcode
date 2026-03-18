-- Write your PostgreSQL query statement below

select e.name, b.bonus
from employee as e
left join bonus as b
on e.empId = b.empId
where bonus IS NULL or bonus < 1000