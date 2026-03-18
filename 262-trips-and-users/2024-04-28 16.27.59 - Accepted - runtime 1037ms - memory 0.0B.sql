# Write your MySQL query statement below
with cte as (Select users_id 
                from Users 
                where banned = "Yes")


select tp.request_at as Day, 
ROUND(SUM(IF(tp.status <> "completed", 1, 0)) / count(tp.status), 2) as "Cancellation Rate"
from trips tp
where tp.client_id not in (Select users_id 
                from Users 
                where banned = "Yes") 
    and tp.driver_id not in (Select users_id 
                from Users 
                where banned = "Yes")
    and tp.request_at between "2013-10-01" and "2013-10-03"
group by tp.request_at


