-- Write your PostgreSQL query statement below
-- product id and change date is pk 
-- new price keeps on changing on every date
-- inital price of each product is 10, so default is 10
-- to find: prices of all products on 08/16/2019
-- logic is : 
-- if the new price of that product exists on 08/16/2019 then that is the price
-- if there is no record on a date on 08/16/2019 but after that date then it is default to 10,
-- if there is a price on a date before 08/16/2019 and after 08/16/2019 then the price will be the price of the date before 08/16
-- return in any order 

-- '2019-08-16'

-- select 
--     product_id,
--     new_price as price,
--     change_date,
--     row_number() over (partition by product_id order by change_date desc) as row_num
-- from products 
-- where change_date <= '2019-08-16'

with interim as (
    select product_id,
    new_price as price,
    row_number() over (partition by product_id order by change_date desc) as row_num
    from products
    where change_date <= '2019-08-16'
)

select product_id,
price
from interim
where row_num = 1
UNION
select product_id, 10 as price
from products 
where product_id not in (select distinct product_id from interim)