# Write your MySQL query statement below
select user_id, max(conseq_window) as biggest_window
from (select user_id, 
        datediff(lag(visit_date, 1, "2021-1-1") over(partition by user_id order by visit_date desc), visit_date) as conseq_window
    from uservisits) t
group by user_id
order by user_id
