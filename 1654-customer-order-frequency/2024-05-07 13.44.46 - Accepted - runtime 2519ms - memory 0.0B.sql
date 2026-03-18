# Write your MySQL query statement below
select c.customer_id, c.name
from orders o
join customers c
on o.customer_id = c.customer_id
join product p
on p.product_id = o.product_id
where date_format(order_date, "%Y") = 2020
group by c.customer_id
having sum(if(date_format(order_date, "%m") = 6, o.quantity * p.price, 0)) >= 100 
and sum(if(date_format(order_date, "%m") = 7, o.quantity * p.price, 0)) >= 100 
