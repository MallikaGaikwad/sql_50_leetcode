# Write your MySQL query statement below

-- select round(count(*)*100 /(select count(1) from delivery), 2) as immediate_percentage
-- from delivery
-- where order_date = customer_pref_delivery_date

select round(sum(if(order_date = customer_pref_delivery_date, 1, 0)) *100 / count(*), 2) as immediate_percentage
from delivery


