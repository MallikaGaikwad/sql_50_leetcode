# Write your MySQL query statement below
with cte as (select count(rating) as cnt_rating
            from movierating
            group by user_id),
    max_cnt as (select max(cnt_rating)
                    from cte),
    cte2 as (select movie_id, avg(rating) as avg_rating
            from movierating mr
            where created_at like "2020-02%"
            group by movie_id),
    max_avg_rating as (select max(avg_rating) from cte2)


(select u.name as results
from users u
join movierating mr
on u.user_id = mr.user_id
group by mr.user_id
having count(rating) = (select * from max_cnt)
order by name
limit 1)

union all

(select mv.title as results
from cte2 c2
Join movies mv
on mv.movie_id = c2.movie_id
where c2.avg_rating = (select * from max_avg_rating)
order by mv.title
limit 1)

