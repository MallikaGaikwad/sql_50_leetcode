# Write your MySQL query statement below

-- select t.*, count(e.subject_name) as attended_exams
-- from (select s.student_id,
--             s.student_name,
--             sb.subject_name
--         from students s
--         cross join subjects sb) as t
-- left Join examinations e
-- on t.student_id = e.student_id and t.subject_name = e.subject_name
-- group by t.student_name, t.subject_name
-- order by t.student_id, t.subject_name

select s.student_id,
        s.student_name,
        sb.subject_name,
        count(e.subject_name) as attended_exams
from students s
cross join subjects sb
left Join examinations e
on s.student_id = e.student_id and sb.subject_name = e.subject_name
group by s.student_name, sb.subject_name
order by s.student_id, sb.subject_name

