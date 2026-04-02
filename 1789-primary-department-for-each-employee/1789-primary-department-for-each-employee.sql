-- Write your PostgreSQL query statement below
-- empid and dept id is unique and pk 
-- primaryFlag is Y and N - if Y then primary dept if N then no
-- one emp can belong to multiple dept 1- many
-- but one emp can have only one primary_flag as Y
-- if the employee has only one dept then flag is N

-- to find: ids of all employees with their primary dept
-- for emp with only one dept, report that dept

with pf_y as (
select 
    employee_id,
    department_id
from employee
where primary_flag = 'Y'
),

count_1 as (
select 
    employee_id,
    department_id
from employee
where employee_id IN 
    (select 
        employee_id 
    from employee 
    group by employee_id 
    having count(*)= 1)
)


select 
    employee_id,
    department_id
from pf_y

union

select 
    employee_id,
    department_id
from count_1
order by employee_id asc
