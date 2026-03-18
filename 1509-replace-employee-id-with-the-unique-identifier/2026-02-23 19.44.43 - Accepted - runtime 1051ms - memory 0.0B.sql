# Write your MySQL query statement below

SELECT unique_id, name
FROM employees as emp
LEFT JOIN employeeuni as emp_u
ON emp.id = emp_u.id