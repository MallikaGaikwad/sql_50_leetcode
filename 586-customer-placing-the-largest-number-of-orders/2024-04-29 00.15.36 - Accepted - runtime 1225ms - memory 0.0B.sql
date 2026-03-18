# Write your MySQL query statement below
with cte as (select customer_number, count(*) as order_cnt
        from orders
        group by customer_number)

select c.customer_number 
from cte c
where c.order_cnt = (select max(order_cnt) from cte)
