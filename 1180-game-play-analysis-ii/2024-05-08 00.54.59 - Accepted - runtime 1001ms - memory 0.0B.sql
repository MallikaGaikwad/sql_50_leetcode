# Write your MySQL query statement below
-- select player_id, device_id
-- from activity
-- where (player_id, event_date) in (select player_id, min(event_date)
--                                     from activity
--                                     group by player_id)
select player_id, device_id
from (select player_id, device_id,
            row_number() over(partition by player_id order by event_date) as rn
        from activity) as t
where t.rn = 1

