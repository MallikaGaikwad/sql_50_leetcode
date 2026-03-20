-- Write your PostgreSQL query statement below

-- if order date = pref delivery date then order status = immediate else scheduled
-- first order of customer = earliest order date that customer made 
-- to find: percentage of immediate orders for all first orders 
-- basically find first orders of each customer which are immediate (filter)
-- then immediate orders/ total order

with order_rank as (
select
    delivery_id,
    customer_id,
    order_date,
    customer_pref_delivery_date,
    row_number() over (partition by customer_id order by order_date) as row_num,
    case
        when order_date = customer_pref_delivery_date 
        then 'immediate'
        else 'scheduled'
    end as status
from delivery
)

select 
    round(
        100 * 
        coalesce(1.0 * count(case when status='immediate' then status else null end),0) 
        / 
        nullif(count(*),0)
    ,2) as immediate_percentage
from order_rank
where row_num = 1