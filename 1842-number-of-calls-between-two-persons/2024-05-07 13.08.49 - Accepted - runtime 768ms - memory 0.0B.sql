# Write your MySQL query statement below
-- select from_id as person1,
--         to_id as person2,
--         count(*) as call_count,
--         sum(duration) as total_duration
-- from (select to_id as from_id,
--         from_id as to_id,
--         duration
--         from calls
--         where from_id > to_id
--         union all
--         select * from calls
--         where from_id < to_id) as tmp
-- group by tmp.from_id, tmp.to_id

select if(from_id < to_id, from_id, to_id) as person1,
    if(from_id > to_id, from_id, to_id) as person2,
    count(*) as call_count,
    sum(duration) as total_duration
from calls
group by person1, person2