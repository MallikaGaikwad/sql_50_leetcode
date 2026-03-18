# Write your MySQL query statement below
-- select d.name as department, e.name as employee, e.salary
-- from employee e
-- join department d
-- on e.departmentId = d.id
-- where (e.departmentId, e.salary) in (select departmentId, max(salary)
--                                         from employee
--                                         group by departmentId)

select d.name as department, e.name as employee, e.salary
from employee e
join department d
on e.departmentId = d.id
join (select departmentId, max(salary) as sal
        from employee
        group by departmentId) as t
on t.departmentId = e.departmentId and e.salary = t.sal