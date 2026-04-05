-- Write your PostgreSQL query statement below
-- product id and change date is pk 
-- new price keeps on changing on every date
-- inital price of each product is 10, so default is 10
-- to find: prices of all products on 08/16/2019
-- logic is : 
-- if the new price of that product exists on 08/16/2019 then that is the price
-- if there is no record on a date on 08/16/2019 but after that date then it is default to 10,
-- if there is a price on a date before 08/16/2019 then the price will be the price of the date before 08/16
-- return in any order 

-- '2019-08-16'

select 
    product_id,
    new_price as price
from products
where (product_id, change_date) IN 
    (select product_id, max(change_date) as change_date
    from products
    where change_date <= '2019-08-16'
    group by product_id)


union all

select distinct
    product_id,
    10 as price
from products 
where (product_id) NOT IN 
    (select product_id
    from products
    where change_date <= '2019-08-16'
    group by product_id)
