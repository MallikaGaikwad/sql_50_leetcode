# Write your MySQL query statement below
select distinct s2.seat_id
from cinema s1
Join cinema s2
on abs(s1.seat_id - s2.seat_id) = 1 and s1.free = True and s2.free = True
order by 1
