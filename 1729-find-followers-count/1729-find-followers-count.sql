-- Write your PostgreSQL query statement below

-- user id and follower id is unique
-- to find: for each user, return count of followes, ordered by user id in ascending order


select 
    user_id,
    count(follower_id) as followers_count
from followers
group by user_id
order by user_id asc