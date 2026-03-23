-- Write your PostgreSQL query statement below
-- subject_id and dept_id is unique, so one teacher could teach the same subject to different depts
-- to find: unique number of subjects per teacher irrespective of the dept

select
    teacher_id,
    count(distinct subject_id) as cnt
from teacher
group by teacher_id