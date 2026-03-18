# Write your MySQL query statement below
-- select tmp.user_id, max(tmp.time_stamp)  as last_stamp
-- from (select *
--         from logins
--         where time_stamp like "2020%") tmp
-- group by tmp.user_id

select user_id, max(time_stamp) as last_stamp
from logins
where time_stamp like "2020%"
group by user_id
