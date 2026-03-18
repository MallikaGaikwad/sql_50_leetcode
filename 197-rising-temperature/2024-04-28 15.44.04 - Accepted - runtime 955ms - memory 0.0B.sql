# Write your MySQL query statement below
with cte as (select * 
            from Weather
            Order by recordDate ASC)

select w1.id as Id
from cte w1
Join cte w2
on Datediff(w1.recordDate, w2.recordDate) = 1 and w1.temperature > w2.temperature

