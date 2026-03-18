# Write your MySQL query statement below
-- select seller_name
-- from seller
-- where seller_id not in (select distinct seller_id 
--                         from orders
--                         where sale_date like "2020%")
-- order by seller_name

select s.seller_name
from seller s
left Join (select distinct seller_id 
        from orders
        where sale_date like "2020%") as o1 
on s.seller_id = o1.seller_id
where o1.seller_id is null
order by s.seller_name
