-- Write your PostgreSQL query statement below

-- with sum_processes as (
-- select machine_id,
--     process_id,
--     sum (case when activity_type = 'end' then timestamp else 0 end) -
--     sum (case when activity_type = 'start' then timestamp else 0 end)
--     as difference
-- from activity
--     group by process_id, machine_id
--     order by machine_id,process_id
-- )

-- select machine_id,
-- round(avg(difference)::numeric,3) as processing_time
-- from sum_processes
-- group by machine_id


with diff_process as (
    select machine_id, 
    process_id,
    timestamp - lag(timestamp) over (partition by machine_id,process_id order by timestamp) as difference
from activity
)

select machine_id,
round(avg(difference)::numeric,3) as processing_time
from diff_process
where difference is not NULL
group by machine_id
