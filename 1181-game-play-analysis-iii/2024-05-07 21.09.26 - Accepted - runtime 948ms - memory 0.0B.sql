# Write your MySQL query statement below

-- select player_id, event_date,
--         sum(games_played) over(partition by player_id order by player_id, event_date) as games_played_so_far
-- from activity a

select a2.player_id, a2.event_date, sum(a1.games_played) as games_played_so_far
from activity a1
join activity a2
on a1.player_id = a2.player_id and a1.event_date <= a2.event_date
group by a2.player_id, a2.event_date
order by a2.player_id, a2.event_date


