# Write your MySQL query statement below
with cte1 as (select concat(lat, lon) as lat_lon
                from Insurance
                group by concat(lat, lon)
                having count(pid) = 1),
    cte2 as (select tiv_2015
                from Insurance
                group by tiv_2015
                having count(pid) > 1)
    
select round(sum(tiv_2016), 2) as tiv_2016
from Insurance i
Join cte1 c1
on concat(i.lat, i.lon) = c1.lat_lon
Join cte2 c2
on i.tiv_2015 = c2.tiv_2015


