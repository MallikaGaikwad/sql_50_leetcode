# Write your MySQL query statement below
with cte1 as (
    SELECT *,count(lat)
    FROM Insurance
    group by lat,lon
    having count(lat) = 1
),
cte2 as (
    SELECT * ,count(pid)
    FROM Insurance
    GROUP BY tiv_2015
    having count(pid) > 1
)

select round(sum(c1.tiv_2016), 2) as tiv_2016
from cte1 c1
join cte2 c2
on c1.tiv_2015 = c2.tiv_2015