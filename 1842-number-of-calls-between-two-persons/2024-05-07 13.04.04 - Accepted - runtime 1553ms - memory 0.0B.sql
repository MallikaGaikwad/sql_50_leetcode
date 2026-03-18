# Write your MySQL query statement below
select from_id as person1,
        to_id as person2,
        count(*) as call_count,
        sum(duration) as total_duration
from (select to_id as from_id,
        from_id as to_id,
        duration
        from calls
        where from_id > to_id
        union all
        select * from calls
        where from_id < to_id) as tmp
group by tmp.from_id, tmp.to_id

-- select from_id as person1,
--         to_id as person2,
--         count(*) as call_count,
--         sum(duration) as total_duration
-- from (select from_id, to_id, duration
--         from calls
--         where from_id < to_id
--         union all
--         select c1.from_id, c1.to_id, c2.duration
--         from calls c1
--         join calls c2
--         on c1.from_id = c2.to_id and c1.to_id = c2.from_id
--         where c1.from_id < c1.to_id
--         group by c1.from_id, c1.to_id) as tmp
-- where tmp.from_id < tmp.to_id
-- group by tmp.from_id, tmp.to_id
