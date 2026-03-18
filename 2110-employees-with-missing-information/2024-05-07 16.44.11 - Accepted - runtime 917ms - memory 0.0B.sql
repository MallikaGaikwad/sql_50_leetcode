
# Write your MySQL query statement below
select t.employee_id
from (select e.employee_id, s.salary, e.name
        from employees e
        left join salaries s
        on e.employee_id = s.employee_id
        union
        select s.employee_id, s.salary, e.name
        from employees e
        right join salaries s
        on e.employee_id = s.employee_id) as t

where t.name is null or t.salary is null
order by 1

 


