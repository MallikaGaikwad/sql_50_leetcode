# Write your MySQL query statement below
select a1.player_id,
    a1.event_date,
   sum(a2.games_played) as games_played_so_far
from activity a1
Join activity a2
on a1.player_id = a2.player_id and a1.event_date >= a2.event_date
group by a1.player_id, a1.event_date
order by 1, 2

-- select a1.player_id,
--     a1.event_date,
--    sum(a1.games_played) over(partition by player_id order by event_date) as games_played_so_far
-- from activity a1
