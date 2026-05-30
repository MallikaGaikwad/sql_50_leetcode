-- Write your PostgreSQL query statement below
-- id is the primary key, order_id is th primary key for orders table

select name as customers
from customers
where id not in (
    select customerId from orders
)