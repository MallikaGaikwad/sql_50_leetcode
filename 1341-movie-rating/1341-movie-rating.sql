-- Write your PostgreSQL query statement below

-- movie_id and title is unique 
-- user_id and name is unique 
-- movie_id and useR_id is primary key means one movie has rating by one user at a time
-- to find: name of the user who has the highest number of movie rating
-- find the moviename with highest average rating in february 2020


select
    name as results
from (select u.user_id, u.name, count(mr.rating) from users as u
join movierating as mr
on u.user_id = mr.user_id
group by u.user_id, u.name
order by count(mr.rating) desc, u.name asc
limit 1)

union all

select 
    title as results
from (select 
    mov.movie_id,
    mov.title,
    avg(mr.rating) as avg
from movies as mov
join movierating as mr
on mov.movie_id = mr.movie_id
where created_at between '2020-02-01' and '2020-02-29'
group by mov.movie_id, mov.title
order by avg desc, mov.title asc
limit 1)


