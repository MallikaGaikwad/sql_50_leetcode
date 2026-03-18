# Write your MySQL query statement below
select a1.player_id, a1.device_id
from activity a1
Join (select player_id, min(event_date) as evt_date
    From activity
    group by player_id) as a2
on a1.event_date = a2.evt_date and a1.player_id = a2.player_id

