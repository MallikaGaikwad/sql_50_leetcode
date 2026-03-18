# Write your MySQL query statement below

# customer_id, confirmation rate -> completed/ total -> round to 2 decimals

select s.user_id, Ifnull(round(sum(action = 'confirmed') / count(action) , 2), 0) as confirmation_rate
from confirmations c
right join signups s
on s.user_id = c.user_id
group by s.user_id




