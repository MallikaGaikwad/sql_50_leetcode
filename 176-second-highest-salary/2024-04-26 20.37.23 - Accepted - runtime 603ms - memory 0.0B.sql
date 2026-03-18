# Write your MySQL query statement below
-- select max(salary) as SecondHighestSalary from Employee 
-- where salary < (select max(salary)
--                 from Employee)

select max(salary) as SecondHighestSalary 
from Employee e1
Join (select max(salary) as sal
        from Employee) as e2 
on e1.salary < e2.sal




