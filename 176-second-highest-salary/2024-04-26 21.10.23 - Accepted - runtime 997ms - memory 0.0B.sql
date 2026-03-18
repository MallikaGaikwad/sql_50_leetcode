# Write your MySQL query statement below
-- select max(salary) as SecondHighestSalary from Employee 
-- where salary < (select max(salary)
--                 from Employee)

-- select max(salary) as SecondHighestSalary 
-- from Employee e1
-- Join (select max(salary) as sal
--         from Employee) as e2 
-- on e1.salary < e2.sal

select max(salary) as SecondHighestSalary from Employee e1
where 1 = (select count(distinct salary)
            from Employee e2
            where e1.salary < e2.salary)

-- with cte as (select salary, dense_rank() over (order by salary desc) as dr
--             from Employee)

-- select max(salary) as SecondHighestSalary from cte
-- where dr = 2







