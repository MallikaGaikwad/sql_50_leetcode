-- Write your PostgreSQL query statement below
-- pid is the pk so one pid one investment amount one lat one lon
-- to find: sum of tiv2016 for all pid
--1. who have same tiv2015 value as others
-- 2. are not located in the same city (unique lat lon)
-- round tiv2016 in 2 decimals

with tiv_2015_all as (
select 
    pid,
    tiv_2015, 
    tiv_2016, 
    lat, 
    lon
from insurance 
where tiv_2015 IN
(select tiv_2015
from insurance 
group by tiv_2015
having count(tiv_2015) > 1)
),

lat_lon as (
select 
    pid,
    tiv_2015, 
    tiv_2016, 
    lat, 
    lon
from tiv_2015_all 
where lat || '-' || lon  NOT IN
(select lat || '-' || lon 
from insurance 
group by lat, lon
having count(lat || '-' || lon ) > 1)
)

select 
    round(CAST (sum(tiv_2016) as DECIMAL),2) as tiv_2016
from lat_lon

