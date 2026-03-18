# Write your MySQL query statement below
select c.name as country
from country c
Join person p
on c.country_code = substr(p.phone_number, 1, 3)
join (select caller_id, duration
        from calls
        union all
        select callee_id, duration
        from calls) t
on p.id = t.caller_id
group by c.country_code
having avg(t.duration) > (select avg(duration) as global_avg
                            from calls)
