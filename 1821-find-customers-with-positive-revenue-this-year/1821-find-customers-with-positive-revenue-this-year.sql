-- Write your PostgreSQL query statement below
-- to find: customers with positive revenue in year 2021
-- condition: positive revenue means revenue > 0 
-- 

select distinct customer_id
from customers
where year = '2021' and revenue > 0
