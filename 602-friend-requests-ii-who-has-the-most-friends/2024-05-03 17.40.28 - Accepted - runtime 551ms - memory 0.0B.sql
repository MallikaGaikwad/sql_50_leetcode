# Write your MySQL query statement below

with cte as (
    SELECT requester_id as id
    FROM RequestAccepted
    UNION all
    SELECT accepter_id as id
    FROM RequestAccepted
)

SELECT id , Count(id) as num
FROM CTE 
group by id
order by  Count(id) desc
limit 1