# Write your MySQL query statement below
select p.project_id, p.employee_id
from project p
left join employee e
on e.employee_id = p.employee_id
where (p.project_id, e.experience_years) in (select p.project_id, max(e.experience_years)
                                                from project p
                                                left join employee e
                                                on e.employee_id = p.employee_id
                                                group by project_id)
