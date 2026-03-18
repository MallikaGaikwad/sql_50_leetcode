# Write your MySQL query statement below

with emp_details as (
    select e.id,e.name as emp_name, m.managerId, m.name as manager_name
    from employee as e
    left join employee as m
    on e.id=m.managerId
)

select emp_name as name
from emp_details
group by managerId
having count(managerId) >= 5