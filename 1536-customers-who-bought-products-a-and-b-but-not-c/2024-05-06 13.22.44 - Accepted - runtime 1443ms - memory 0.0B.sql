# Write your MySQL query statement below
select c.customer_id, c.customer_name
from customers c
Join orders o
on c.customer_id = o.customer_id
group by c.customer_id
having sum(o.product_name = "A") > 0 and sum(o.product_name = "B") > 0
and sum(o.product_name = "C") = 0
order by c.customer_id
