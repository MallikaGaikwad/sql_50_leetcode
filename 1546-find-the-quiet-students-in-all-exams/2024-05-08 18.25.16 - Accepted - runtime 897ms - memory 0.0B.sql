# Write your MySQL query statement below
with cte as (select s.student_id, s.student_name, e.score, e.exam_id,
                    max(score) over(partition by exam_id) as max_score,
                    min(score) over(partition by exam_id) as min_score
                from exam e
                join student s
                on e.student_id = s.student_id),
    tmp as (select distinct student_id
                from cte t
                where t.score = max_score or t.score = min_score)



select distinct student_id, student_name
from cte
where student_id not in (select * from tmp)
order by student_id
