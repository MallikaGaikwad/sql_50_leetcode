-- Write your PostgreSQL query statement below
-- customer id is not null but can be duplicate means 1 customer might have purchased more than 1 products many times
-- product key is pk of product table
-- to find: customers who have bought all the products in the product table

select 
    customer_id
from customer as c
left join product as p 
using (product_key)
group by customer_id
having count(distinct c.product_key) = (select count(distinct product_key) from product)
