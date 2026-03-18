# Write your MySQL query statement below
select sp.name
from salesperson sp
where sp.sales_id not in (select o.sales_id
                            from orders o
                            Join company c
                            on o.com_id = c.com_id
                            group by sales_id
                            having sum(c.name = "RED") > 0)


