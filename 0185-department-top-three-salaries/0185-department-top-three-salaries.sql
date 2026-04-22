-- Write your PostgreSQL query statement below
-- to find: employees who are high earners in each dept
-- high earner who has salary in the top three unique for that dept

with join_table as (
select 
    e.id as e_id, 
    e.name as Employee, 
    e.salary as Salary, 
    d.name as Department,
    dense_rank() over (partition by d.name order by e.salary desc) as sal_rank
from employee as e
join department as d
on e.departmentID = d.id
)

select
    Department,
    Employee,
    Salary
from join_table
where sal_rank <= 3