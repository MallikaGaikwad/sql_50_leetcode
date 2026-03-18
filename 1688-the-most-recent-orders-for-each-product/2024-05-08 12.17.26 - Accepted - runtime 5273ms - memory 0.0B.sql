# Write your MySQL query statement below
-- select p.product_name, o.product_id, o.order_id, o.order_date
-- from orders o
-- join products p
-- on o.product_id = p.product_id
-- where (o.product_id, o.order_date) in (select product_id, max(order_date) as date
--                                     from orders
--                                     group by product_id)
-- order by 1, 2, 3


select p.product_name, o.product_id, o.order_id, o.order_date
from products p
join (select *,
        dense_rank() over(partition by product_id order by order_date desc) as drnk
        from orders) as o
on p.product_id = o.product_id and o.drnk = 1
order by 1, 2, 3



