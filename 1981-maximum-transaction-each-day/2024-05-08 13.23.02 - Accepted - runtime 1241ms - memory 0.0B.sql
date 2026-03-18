# Write your MySQL query statement below

select transaction_id
from transactions
where (date_format(day, "%Y-%m-%d"), amount) in (select date_format(day, "%Y-%m-%d") as date, max(amount) as max_amt
                                                    from transactions 
                                                    group by date_format(day, "%Y-%m-%d"))
order by transaction_id
