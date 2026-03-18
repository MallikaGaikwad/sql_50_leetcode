# Write your MySQL query statement below
with cte as (select player_id, min(event_date) as event_date
                from activity
                group by player_id)

select round(count(1) / (select count(player_id) from cte), 2) as fraction
from cte c
join activity a2
on c.player_id = a2.player_id and datediff(a2.event_date, c.event_date) = 1
