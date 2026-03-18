# Write your MySQL query statement below
select student_id, min(course_id) as course_id, grade
from enrollments
where (student_id, grade) in (select student_id, max(grade) as grade
                                from enrollments
                                group by student_id)
group by student_id, grade
order by student_id

-- select student_id, course_id, grade
-- from (select student_id, course_id, grade,
--         dense_rank() over(partition by student_id order by grade desc, course_id asc) as drnk
--     from enrollments) as t 
-- where t.drnk = 1
-- order by student_id