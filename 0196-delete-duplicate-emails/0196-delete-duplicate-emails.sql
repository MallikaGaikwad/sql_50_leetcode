-- Write your PostgreSQL query statement below
-- id is pk so one id one email
-- to find: delete all duplicate emails keeping the one with smaller id

DELETE
from person p1
using person p2
where p1.email = p2.email
and p1.id > p2.id