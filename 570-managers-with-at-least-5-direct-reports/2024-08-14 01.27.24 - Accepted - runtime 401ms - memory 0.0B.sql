# Write your MySQL query statement below


SELECT e.name
FROM Employee emp
JOIN Employee e ON emp.managerId = e.Id
GROUP BY emp.managerId 
HAVING COUNT(emp.managerId) >= 5; 


-- SELECT name
-- FROM employee
-- WHERE id IN (
--         SELECT managerId
--         FROM employee
--         GROUP BY managerId
--         HAVING COUNT(*) >= 5
--     );

