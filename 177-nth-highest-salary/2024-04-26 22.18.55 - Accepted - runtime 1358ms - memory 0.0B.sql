CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
        with cte as (Select salary,
                dense_rank() over(order by salary desc) as dr
                from Employee
                )
                
        select max(salary) as getNthHighestSalary
        from cte
        where dr = N
  );
END