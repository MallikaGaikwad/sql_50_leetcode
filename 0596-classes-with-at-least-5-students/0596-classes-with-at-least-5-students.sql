-- Write your PostgreSQL query statement below
-- student class unique row
-- to find: all classes with atleast 5 distinct students

select
    class
from courses
group by class
having count(distinct student) >= 5
