# Write your MySQL query statement below
-- SELECT p.firstName,p.lastName, IFNULL(NUll,Ad.City) as City , IFNULL(NUll,Ad.state) as State
-- FROM Person p 
-- LEFT JOIN Address Ad ON p.personId = Ad.personId

SELECT p.firstName, p.lastName, Ad.City, Ad.state
FROM Person p 
LEFT JOIN Address Ad ON p.personId = Ad.personId