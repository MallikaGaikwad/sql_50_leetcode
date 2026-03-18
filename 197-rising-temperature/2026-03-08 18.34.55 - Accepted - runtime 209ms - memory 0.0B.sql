-- -- Write your PostgreSQL query statement below

with temp_values as (
select 
    w1.id, 
    w1.recordDate, 
    w1.temperature as temp1, 
    w2.recordDate+1 as nextDate,
    w2.temperature as temp2
from weather as w1
left join weather as w2
on w1.recordDate = w2.recordDate+1
)

select id
from temp_values 
where temp1 > temp2