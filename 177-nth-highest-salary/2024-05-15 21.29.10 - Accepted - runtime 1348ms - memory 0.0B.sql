CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
         # Write your MySQL query statement below.
        select max(salary) as getNthHighestSalary
        from employee e1
        where N-1 = (select count(distinct salary) 
                    from employee e2
                    where e1.salary < e2.salary)
 );
END