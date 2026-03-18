# Write your MySQL query statement below
SELECT customer_id
FROM Customers
where year = '2021'
group by customer_id
having sum(revenue) > 0