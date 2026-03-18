# Write your MySQL query statement below

with cte as (select customer_id, name, visited_on, sum(amount) as amount
            from customer
            group by visited_on
            order by visited_on)

select c2.visited_on, sum(c1.amount) as amount, round(avg(c1.amount), 2) as average_amount
from cte c1
join cte c2
on datediff(c2.visited_on, c1.visited_on) between 0 and 6
group by c2.visited_on
having count(c1.amount) = 7
