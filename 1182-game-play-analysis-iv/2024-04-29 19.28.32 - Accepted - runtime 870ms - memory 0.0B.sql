# Write your MySQL query statement below
with cte as (select player_id, min(event_date) as event_date
            from activity
            group by player_id)

select round(count(*) / (select count(distinct player_id) from activity), 2) as fraction
from activity a1
Join cte c1
on a1.player_id = c1.player_id and datediff(a1.event_date, c1.event_date) = 1
