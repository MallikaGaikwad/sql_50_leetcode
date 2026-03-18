# Write your MySQL query statement below
with cte as (select users_id 
                from users
                where banned = "Yes")

select request_at as "day",
        round(sum(status like "cancelled%")/count(*), 2) as "Cancellation Rate"
from trips
where client_id not in (select * from cte)
and driver_id not in (select * from cte)
and request_at between "2013-10-01" and "2013-10-03"
group by request_at
