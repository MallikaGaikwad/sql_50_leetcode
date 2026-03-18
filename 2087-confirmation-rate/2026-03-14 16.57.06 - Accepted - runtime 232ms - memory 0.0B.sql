
-- select s.user_id,
-- round (avg(case when action= 'confirmed' then 1 else 0 end),2) as confirmation_rate
-- from signups as s
-- left join confirmations as c
-- on s.user_id = c.user_id
-- group by s.user_id

select
s.user_id,
round(coalesce( sum(case when action= 'confirmed' then 1.0 else 0.0 end) / count(s.user_id),0),2) as confirmation_rate
from signups as s
left join confirmations as c
on s.user_id = c.user_id
group by s.user_id