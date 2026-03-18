# Write your MySQL query statement below
select s1.id, s2.student
from seat s1
join seat s2
on s1.id + 1 = s2.id and MOD(s1.id, 2) = 1 and MOD(s2.id, 2) = 0

Union all

(select s2.id, s1.student
from seat s1
join seat s2
on s1.id + 1 = s2.id and MOD(s1.id, 2) = 1 and MOD(s2.id, 2) = 0)

union all

(select * 
from seat 
where (select MOD(count(id), 2)
from seat) = 1
order by id desc 
limit 1)

order by id

