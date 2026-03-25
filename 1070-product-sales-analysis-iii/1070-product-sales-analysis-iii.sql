-- Write your PostgreSQL query statement below
-- sale_id and year is unique but might have product with multiple sales in the year so one row per sale and year
-- to find: all sales in the 1st year each product was sold
-- solution: to get the first year we use row_num

with first_yr as (
select
    sale_id,
    product_id,
    year,
    quantity,
    price,
    rank() over (partition by product_id order by year) as rank_sales
from sales
)

select 
    product_id,
    year as first_year,
    quantity,
    price
from first_yr 
where rank_sales = 1
group by product_id, year, quantity, price
