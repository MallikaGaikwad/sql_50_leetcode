# Write your MySQL query statement below
select sale_date, sum(if(fruit = "apples", sold_num, -sold_num)) as diff
from sales
group by sale_date
order by sale_date
