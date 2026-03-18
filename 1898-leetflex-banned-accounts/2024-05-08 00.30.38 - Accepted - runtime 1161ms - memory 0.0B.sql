# Write your MySQL query statement below
with cte as (select *
                from loginfo
                order by account_id, login)

select distinct l1.account_id
from cte l1
join cte l2
on l1.account_id = l2.account_id 
and l1.ip_address != l2.ip_address
and l2.login <= l1.logout and l1.login <= l2.logout

