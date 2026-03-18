
# Write your MySQL query statement below
select employee_id,IF(employee_id%2 != 0 and name not like 'm%', salary ,0) AS Bonus from employees order by employee_id
    
   