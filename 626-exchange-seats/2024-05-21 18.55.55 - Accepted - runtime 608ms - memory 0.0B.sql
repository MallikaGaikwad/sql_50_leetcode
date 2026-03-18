# Write your MySQL query statement below
with cte as (select count(*) from seat)

select (Case 
            when MOD(id, 2) = 1 and id <> (select * from cte) then id+1
            when MOD(id, 2) = 0 then id-1
            else id
        end) as id,
        student
from seat
order by id

