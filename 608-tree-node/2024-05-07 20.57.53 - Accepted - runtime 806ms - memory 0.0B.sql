# Write your MySQL query statement below
with cte as (select distinct p_id as id
                from tree
                where p_id is not null)

-- select * from cte

select id, 
    CASE
        when (id in (select id from cte) and p_id is not null) then "Inner"
        when (p_id is null) then "Root"
        else "Leaf"
    END as type
from tree
