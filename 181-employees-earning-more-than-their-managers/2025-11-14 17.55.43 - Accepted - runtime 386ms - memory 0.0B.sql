# Write your MySQL query statement below
SELECT e.Name as Employee
FROM Employee e
JOIN Employee m on m.id = e.managerId
WHERE m.salary < e.salary

