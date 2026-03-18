-- Write your PostgreSQL query statement below

with totalprice as (
select
    p.product_id, 
    coalesce(1.0 * sum(price * units),0) as total_price
from prices as p
left join unitssold as u
on p.product_id = u.product_id
where purchase_date is null or purchase_date BETWEEN start_date and end_date
group by p.product_id
),

num_products as (
select 
    product_id,
    sum(units) as sum_products
from unitssold
group by product_id
)

select 
    tp.product_id,
    round(coalesce((total_price / sum_products),0),2) as average_price
from totalprice as tp
left join num_products as np
on tp.product_id = np.product_id
group by tp.product_id, total_price, sum_products