CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
Declare M int;
set M = N-1;
  RETURN (
         # Write your MySQL query statement below.
        select distinct salary as getNthHighestSalary
        from employee
        order by salary desc
        limit M, 1
 );
END