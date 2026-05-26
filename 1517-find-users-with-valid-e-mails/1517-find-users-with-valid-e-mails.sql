-- Write your PostgreSQL query statement below

-- prefixname should contain letters, digits, _ , . , - and should start with letter
-- domain should be @leetcode


select 
    distinct 
        user_id, 
        name, 
        mail 
from users
where mail ~ '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\.com$'
