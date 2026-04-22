-- Write your PostgreSQL query statement below
-- user_id - pk means one record
-- to find: fix the names first letter uppercase and all other lowercase


select 
    user_id,
    UPPER(LEFT(name, 1)) || LOWER(SUBSTRING(name from 2)) as name
from users
order by user_id asc

