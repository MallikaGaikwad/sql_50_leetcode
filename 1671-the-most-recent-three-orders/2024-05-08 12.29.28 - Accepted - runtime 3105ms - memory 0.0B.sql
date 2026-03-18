# Write your MySQL query statement below
with cte as (select c.name, o.customer_id, o.order_id, o.order_date,
                    dense_rank() over(partition by customer_id order by order_date desc) as drnk
                from orders o
                join customers c
                on o.customer_id = c.customer_id)

select name as customer_name, customer_id, order_id, order_date
from cte
where drnk < 4
order by 1, 2, 4 desc
