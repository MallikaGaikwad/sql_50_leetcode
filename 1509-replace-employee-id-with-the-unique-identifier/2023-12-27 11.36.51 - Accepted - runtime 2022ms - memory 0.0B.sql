# Write your MySQL query statement below
SELECT Eu.unique_id ,E.Name 
FROM Employees E 
LEFT JOIN EmployeeUNI Eu
ON E.id = Eu.id
