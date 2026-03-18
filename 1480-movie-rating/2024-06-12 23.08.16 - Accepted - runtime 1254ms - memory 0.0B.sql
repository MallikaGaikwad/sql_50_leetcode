# Write your MySQL query statement below
(select u.name as results
from users u
join movierating mr
on u.user_id = mr.user_id
group by mr.user_id
-- having count(rating) = (select * from max_cnt)
order by count(rating) desc, name
limit 1)

union all

(select mv.title as results
from movierating mr
Join movies mv
on mv.movie_id = mr.movie_id
where created_at like "2020-02%"
group by mv.movie_id
-- where c2.avg_rating = (select * from max_avg_rating)
order by avg(mr.rating) desc, mv.title
limit 1)

