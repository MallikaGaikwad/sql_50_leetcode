-- Write your PostgreSQL query statement below
-- id is primary key so unique througout

with prev_next as (
select
    lag(id) over (order by id) as prev_id,
    id,
    lead(id) over (order by id) as next_id,
    lag(student) over (order by id) as prev_student,
    student,
    lead(student) over (order by id) as next_student
from seat
group by id, student
order by id asc
)

select 
    id,
    case
    when id % 2 != 0 and id + 1  = next_id then next_student
    when id % 2 = 0 and prev_id = id - 1 then prev_student
    when id % 2 != 0 and next_id is null then student
end as student
from prev_next