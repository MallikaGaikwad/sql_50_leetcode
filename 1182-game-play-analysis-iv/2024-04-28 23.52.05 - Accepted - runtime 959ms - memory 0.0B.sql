# Write your MySQL query statement below

-- select round(count(distinct a1.player_id) / (select count(distinct player_id) from activity), 2) as fraction
-- from activity a1
-- Join activity a2
-- on a1.player_id = a2.player_id and a2.event_date - a1.event_date = 1

select round(count(*) / (select count(distinct player_id) from activity), 2) as fraction
from activity a1
Join (select player_id, min(event_date) as min_date
        from activity
        group by player_id) as a2
on a1.player_id = a2.player_id and datediff(a1.event_date, a2.min_date) = 1

