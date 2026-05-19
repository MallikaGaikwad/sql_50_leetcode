-- Write your PostgreSQL query statement below

select
    sell_date,
    count(distinct product) as num_sold,
    string_agg(distinct product, ',' ORDER BY product ASC) as products
from activities
group by sell_date
order by sell_date asc


