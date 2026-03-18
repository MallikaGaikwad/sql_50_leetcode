# Write your MySQL query statement below
select t.*,
    count(e.student_id) as attended_exams
from (select s.*, sb.*
        from students s
        cross join subjects sb) as t
left join examinations e
on e.student_id = t.student_id and e.subject_name = t.subject_name
group by t.student_id, t.subject_name
order by t.student_id, t.subject_name

