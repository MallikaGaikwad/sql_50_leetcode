-- Write your PostgreSQL query statement below

-- we need to calculate trans_count and approved_count first by month and country

select 
    to_char (trans_date, 'yyyy-mm') as month,
    country,
    count(*) as trans_count,
    count(case when state = 'approved' then state else null end) as approved_count,
    coalesce(sum(amount),0) as trans_total_amount, 
    coalesce(sum(case when state = 'approved' then amount else null end),0) as approved_total_amount
from transactions
group by country, month
order by month


--extract (year from trans_date), extract(month from trans_date)
