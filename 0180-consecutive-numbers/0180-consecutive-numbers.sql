with prev_next as (
select
    id,
    lag(num) over (order by id) as prev_num,
    num,
    lead(num) over (order by id) as next_num
from logs
)

select
    distinct num as ConsecutiveNums
from prev_next
where prev_num = num AND num = next_num 




