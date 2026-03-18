# Write your MySQL query statement below
select distinct l1.num as ConsecutiveNums
from logs l1
Join logs l2
on l1.id = l2.id + 1 and l1.num = l2.num
Join logs l3
on l2.id = l3.id + 1 and l2.num = l3.num 



