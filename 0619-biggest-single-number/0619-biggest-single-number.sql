-- Write your PostgreSQL query statement below
-- num may have duplicates, no pk 

with single_num as (
select 
    num,
    count(num) as single_num
from mynumbers
group by num
having count(num) = 1
)

select 
    max(num) as num
from single_num

