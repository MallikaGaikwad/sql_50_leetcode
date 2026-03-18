# Write your MySQL query statement below

-- select max(salary) as SecondHighestSalary
-- from Employee
-- where salary < (select max(salary) from Employee)

select max(e1.salary) as SecondHighestSalary
from Employee e1
Join Employee e2
where e1.salary < e2.salary

-- select max(salary) as SecondHighestSalary
-- from Employee e1
-- where 1 = (select count(distinct salary)
--             from Employee e2
--             where e2.salary < e1.salary)

-- with cte as (select salary,
--             dense_rank() over(order by salary desc) as drnk
--             from Employee)

-- select max(salary) as SecondHighestSalary from cte
-- where drnk = 2
