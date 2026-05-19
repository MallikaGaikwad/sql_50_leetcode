-- Write your PostgreSQL query statement below

-- id is the primary key, each row for this contains salary
-- to find: second highest distinct salary; if no second highest that means only one emp, return null

-- select (
-- select distinct secondhighestsalary from
-- (
-- select
--     salary as secondhighestsalary,
--     dense_rank() over (order by salary desc) as dense_rank
-- from employee
-- )
-- where dense_rank = 2
-- ) as secondhighestsalary


select max(salary) as secondhighestsalary
from employee
where salary < (select max(salary) from employee)

