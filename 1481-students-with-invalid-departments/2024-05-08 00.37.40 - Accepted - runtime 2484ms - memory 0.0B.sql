-- # Write your MySQL query statement below
-- select s.id, s.name
-- from students s
-- left join departments d
-- on d.id = s.department_id
-- where d.id is null

select id, name
from students
where department_id not in (select id from departments)
