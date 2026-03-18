# Write your MySQL query statement below
-- select email as Email
-- from Person
-- Group by email
-- having Count(email) > 1

-- With cte as (select email,
--             row_number() over(partition by email order by email desc) as rn
--             from Person
--             )
-- select email as Email 
-- from cte
-- where rn > 1

select distinct e1.email
from Person e1
join Person e2
on e1.id < e2.id and e1.email = e2.email
