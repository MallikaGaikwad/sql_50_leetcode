# Write your MySQL query statement below

# products that have changed price on or before the given date 
-- -> select price corresponding to last change date
with cte as (select product_id, max(change_date) as last_change_date
                                    from products
                                    where change_date <= "2019-08-16"
                                    group by product_id)

select product_id, new_price as price
from products
where (product_id, change_date) in (select * from cte)
Union all
select distinct product_id, 10 as price
from products
where product_id not in (select product_id from cte)
order by product_id





