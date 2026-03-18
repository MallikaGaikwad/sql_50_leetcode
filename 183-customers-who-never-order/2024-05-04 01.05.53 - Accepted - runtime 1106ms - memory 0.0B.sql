# Write your MySQL query statement below
SELECT c.name as customers
FROM customers c 
where c.id not in (select distinct(customerid) from orders)