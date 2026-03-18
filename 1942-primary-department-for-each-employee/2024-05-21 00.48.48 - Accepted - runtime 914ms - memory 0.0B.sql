# Write your MySQL query statement below


select employee_id, department_id
from employee
where primary_flag = "Y"
union all
select employee_id, department_id
from (select *
        from employee
        group by employee_id
        having primary_flag = "N" and count(department_id) = 1) t
order by employee_id

