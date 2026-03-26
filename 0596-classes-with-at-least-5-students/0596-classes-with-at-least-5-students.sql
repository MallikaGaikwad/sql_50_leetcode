-- Write your PostgreSQL query statement below
-- student class unique row
-- to find: all classes with atleast 5 students

select
    class
from courses
group by class
having count(student) >= 5
