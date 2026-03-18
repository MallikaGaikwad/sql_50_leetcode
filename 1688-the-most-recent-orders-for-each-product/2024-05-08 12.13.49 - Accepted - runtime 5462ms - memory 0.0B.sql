# Write your MySQL query statement below
select p.product_name, o.product_id, o.order_id, o.order_date
from orders o
join products p
on o.product_id = p.product_id
where (o.product_id, o.order_date) in (select product_id, max(order_date) as date
                                    from orders
                                    group by product_id)
order by 1, 2, 3
