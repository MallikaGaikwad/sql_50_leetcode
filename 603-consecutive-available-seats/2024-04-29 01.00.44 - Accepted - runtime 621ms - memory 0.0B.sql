# Write your MySQL query statement below
select distinct c1.seat_id
from cinema c1
Join cinema c2
on abs(c1.seat_id - c2.seat_id) = 1 and c1.free = true and c2.free = true
order by seat_id
