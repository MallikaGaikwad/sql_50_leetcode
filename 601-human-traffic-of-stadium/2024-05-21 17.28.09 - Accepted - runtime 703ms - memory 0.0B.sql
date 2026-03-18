# Write your MySQL query statement below
with cte as (select *,
                row_number() over(order by id) as rn
            from stadium
            where people >= 100),
        
    cte2 as (select id - rn as common_group
                from cte
                group by id - rn
                having count(visit_date) >= 3)

select id, visit_date, people
from cte
where id - rn in (select * from cte2)
order by visit_date

 
