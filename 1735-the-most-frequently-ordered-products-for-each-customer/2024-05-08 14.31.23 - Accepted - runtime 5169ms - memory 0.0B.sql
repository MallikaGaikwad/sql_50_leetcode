# Write your MySQL query statement below
with cte as (select customer_id, product_id, count(order_id) as order_freq
                from orders
                group by customer_id, product_id)

select customer_id, c1.product_id, p.product_name
from cte c1
join products p
on c1.product_id = p.product_id
where (customer_id, order_freq) in (select customer_id, max(order_freq) as max_order_freq
                                    from cte
                                    group by customer_id)


