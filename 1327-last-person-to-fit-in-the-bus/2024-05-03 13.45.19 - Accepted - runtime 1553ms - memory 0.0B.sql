# Write your MySQL query statement below
select tmp.Name as person_name
from (select turn, person_id as ID, person_name as Name, Weight,
    sum(weight) over(order by turn) as Total_Weight
    from Queue) as tmp
where tmp.Total_Weight <= 1000
order by Total_Weight desc
limit 1

