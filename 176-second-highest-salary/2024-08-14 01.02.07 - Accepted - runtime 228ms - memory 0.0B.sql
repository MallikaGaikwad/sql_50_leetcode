# Write your MySQL query statement below

SELECT
    IFNULL(Null,
      (SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
        LIMIT 1 OFFSET 1)
  ) AS SecondHighestSalary