# Write your MySQL query statement below
with cat_table as (select "Low Salary" as category
        union all
        select "High Salary" as category
        union all
        select "Average Salary" as category)

select c.category, ifnull(count(income), 0) as accounts_count
from (select * from cat_table) as c
left Join (select *,
        CASE
            when income < 20000 then "Low Salary"
            when income between 20000 and 50000 then "Average Salary"
            ELSE "High Salary"
        END as category
    from accounts) as tmp
on c.category = tmp.category
group by category


