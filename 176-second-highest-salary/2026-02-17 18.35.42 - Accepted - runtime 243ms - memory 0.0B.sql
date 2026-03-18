# Write your MySQL query statement below

-- select max(salary) as Secondhighestsalary
-- from employee 
-- where salary < (select max(salary) from employee)

select (
    select distinct salary 
from (select salary,
dense_rank() over (order by salary desc) as rnk
from employee
)as rank_emp
where rnk = 2
) as secondhighestsalary

