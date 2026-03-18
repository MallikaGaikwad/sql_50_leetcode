# Write your MySQL query statement below
select sale_date, sum(CASE when fruit = "apples" then sold_num else -sold_num END) as diff
from sales
group by sale_date
order by sale_date
