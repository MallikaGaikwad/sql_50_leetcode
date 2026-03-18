-- Write your PostgreSQL query statement below

-- we know that project_id and emp_id are unique
-- so there could be multiple projects done by same employee and a project can have many employees; both together are unique
-- emp table has one record per employee, all rows are unique to each other; no nulls
-- project table can have no matches as not every emp will have projects


select 
    project_id,
    round(avg (experience_years),2) as average_years
from employee as e
right join project as p
on e.employee_id = p.employee_id
group by project_id
order by project_id