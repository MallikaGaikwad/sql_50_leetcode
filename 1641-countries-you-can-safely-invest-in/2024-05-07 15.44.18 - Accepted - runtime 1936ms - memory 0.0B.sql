# Write your MySQL query statement below
select c.name as country
from country c
Join person p
on c.country_code = substr(p.phone_number, 1, 3)
join calls cl
on p.id = cl.caller_id or p.id = cl.callee_id
group by c.name
having avg(cl.duration) > (select avg(duration) as global_avg
                            from calls)
