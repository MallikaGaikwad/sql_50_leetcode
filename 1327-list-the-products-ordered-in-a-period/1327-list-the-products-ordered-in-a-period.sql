-- Write your PostgreSQL query statement below

with cte_1 as (
select 
    product_id,
    sum(unit) as unit
from orders
where order_date >= '2020-02-01' and order_date < '2020-03-01'
group by product_id
)

select 
    p.product_name,
    c.unit
from products as p
join cte_1 as c
on p.product_id = c.product_id
where unit >= 100
group by p.product_name, c.unit