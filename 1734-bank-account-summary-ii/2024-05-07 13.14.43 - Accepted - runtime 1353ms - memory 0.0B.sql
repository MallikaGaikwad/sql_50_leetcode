# Write your MySQL query statement below
select u.name, sum(t.amount) as balance
from transactions t
join users u
on u.account = t.account
group by t.account
having sum(amount) > 10000
