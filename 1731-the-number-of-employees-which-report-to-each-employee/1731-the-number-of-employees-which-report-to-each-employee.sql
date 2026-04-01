-- Write your PostgreSQL query statement below
-- employee id is unique and pk
-- reports to can be null
-- an employee is a manager who has atleast 1 employee reporting to them
-- to find: 
-- 1. ids and names of the managers 
-- 2. no of emps who directly report to them
-- 3. avg age of employees whoe report to them rounded to nearest integer
-- 4. return the result order by emp id asc


select
    m.employee_id,
    m.name,
    count(e.reports_to) as reports_count,
    round(avg(e.age),0) as average_age
from employees as e
left join employees as m
on e.reports_to = m.employee_id
where e.reports_to is not null
group by m.employee_id, m.name
order by m.employee_id asc
