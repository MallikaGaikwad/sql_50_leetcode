# Write your MySQL query statement below
select e1.employee_id, e2.cnt as team_size
from employee e1
Join (select team_id, count(employee_id) as cnt
        from employee
        group by team_id) as e2
on e1.team_id = e2.team_id
