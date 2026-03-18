# Write your MySQL query statement below
select d.name as Department, t.name as Employee, salary as Salary
from Department d
Join (select name,
        salary,
        departmentId,
        dense_rank() over(partition by departmentId order by salary desc) as rk
    from Employee) as t
On d.id = t.departmentId
where t.rk < 4
