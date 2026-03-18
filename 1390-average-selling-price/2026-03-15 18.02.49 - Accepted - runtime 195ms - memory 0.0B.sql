-- Write your PostgreSQL query statement below

select
    p.product_id, 
    round(coalesce(1.0 * sum(price * units) / nullif(sum(units),0),0),2) as average_price
from prices as p
left join unitssold as u
on p.product_id = u.product_id
and purchase_date BETWEEN start_date and end_date
group by p.product_id