# Write your MySQL query statement below
with cte as (select distinct t1.id
                from tree t1
                join tree t2
                on t1.id = t2.p_id and t1.p_id is not null)

select id, 
    CASE
        when (p_id is null) then "Root"
        when (id in (select id from cte)) then "Inner"
        else "Leaf"
    END as type
from tree
