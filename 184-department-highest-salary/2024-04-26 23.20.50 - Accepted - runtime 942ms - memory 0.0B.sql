# Write your MySQL query statement below

-- with cte as (
-- select d.name as Department,
--     e.name as Employee,
--     e.salary og,
--     max(e.salary) over(partition by e.departmentId) as Salary
-- from Employee e
-- Join Department d
-- on e.departmentId = d.id
-- order by 1
-- )

-- select Department, Employee, Salary
-- from cte
-- where og = Salary

select d.name as Department,
    e.name as Employee,
    e.salary as Salary
from Employee e
Join Department d
on e.departmentId = d.id
where (e.departmentId, e.salary) in (select departmentId, max(salary)
                                        from Employee
                                        Group by departmentId )

