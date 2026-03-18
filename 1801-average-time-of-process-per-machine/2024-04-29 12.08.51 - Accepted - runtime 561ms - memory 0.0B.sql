# Write your MySQL query statement below

with st_process as (select *
                    from activity
                    where activity_type = "start"),
    end_process as (select *
                    from activity
                    where activity_type = "end")


select s.machine_id,
    round((sum(e.timestamp - s.timestamp))/(select count(process_id) from st_process group by machine_id limit 1), 3) 
    as processing_time
from st_process s
Join end_process e
on s.machine_id = e.machine_id and s.process_id = e.process_id
group by s.machine_id


