-- Write your PostgreSQL query statement below

select *
from cinema
where description != 'boring'
and id in (
    select id from cinema where id % 2 != 0 )
order by rating desc