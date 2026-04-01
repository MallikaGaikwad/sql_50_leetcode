-- Write your PostgreSQL query statement below
-- employee id is unique and pk
-- reports to can be null
-- an employee is a manager who has atleast 1 employee reporting to them
-- to find: 
-- 1. ids and names of the managers 
-- 2. no of emps who directly report to them
-- 3. avg age of employees whoe report to them rounded to nearest integer
-- 4. return the result order by emp id asc

with emp_mgr_table as (
select
    e.employee_id,
    e.name,
    e.reports_to,
    e.age,
    m.employee_id as manager_id,
    m.name as manager_name
from employees as e
left join employees as m
on e.reports_to = m.employee_id
where e.reports_to is not null
)

select 
    manager_id as employee_id,
    manager_name as name,
    count(reports_to) as reports_count,
    round(avg(age),0) as average_age
from emp_mgr_table 
group by manager_id, manager_name
order by employee_id