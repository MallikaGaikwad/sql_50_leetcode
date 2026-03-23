-- Write your PostgreSQL query statement below
-- may have duplicate rows, one user may have multiple session_ids and activity_types
-- to find: daily active user count from 2019-06-27 to 2019-07-27 inclusive so have to use 07-28 while using BETWEEN clause
-- even any one activity is conisdered active on that day

select 
    activity_date as day,
    count(distinct user_id) as active_users
from activity
where activity_date BETWEEN '2019-06-28' AND '2019-07-27' 
group by day
