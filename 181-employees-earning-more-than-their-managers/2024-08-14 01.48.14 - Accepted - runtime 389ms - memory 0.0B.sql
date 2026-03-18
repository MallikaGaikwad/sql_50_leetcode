# Write your MySQL query statement below
SELECT e.Name as Employee
FROM Employee e
JOIN Employee m on m.id = e.managerId
WHERE m.salary < e.salary

-- # Write your MySQL query statement below
-- select e.name as Employee
-- from Employee e
-- Join Employee m
-- on e.managerId = m.id
-- and e.salary > m.salary