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
    min(year) over (partition by product_id) as min_yr
from sales
)

select 
    product_id,
    min_yr as first_year,
    quantity,
    price
from first_yr
where min_yr= year
