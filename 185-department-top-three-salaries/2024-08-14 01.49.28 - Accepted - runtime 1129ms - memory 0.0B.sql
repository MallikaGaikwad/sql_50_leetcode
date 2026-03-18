# Write your MySQL query statement below

select Department, Employee, Salary
from (select d.name as Department, e.name as Employee, salary as Salary,
            dense_rank() over(partition by departmentId order by salary desc) as drnk
        from Employee e
        Join Department d
        on e.departmentId = d.id) as tmp
where tmp.drnk < 4

