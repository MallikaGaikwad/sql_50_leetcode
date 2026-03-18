# Write your MySQL query statement below

with ds1 as (select t1.customer_id,
                    t1.transaction_date
                    from transactions t1
                    join transactions t2
                    on t1.customer_id = t2.customer_id
                    and t2.amount > t1.amount
                    and datediff(t2.transaction_date, t1.transaction_date) = 1),
    
    ds2 as (select *,
                row_number() over(partition by customer_id order by transaction_date) as rn
            from ds1),

    ds3 as (select customer_id, transaction_date, 
                date_sub(transaction_date, Interval rn Day) as date_group
            from ds2),

    ds4 as (select customer_id, min(transaction_date) as consecutive_start,
                count(*) as cnt
            from ds3
            group by customer_id, date_group)


select customer_id,
       consecutive_start,
       date_add(consecutive_start, Interval cnt day) as consecutive_end
from ds4
where ds4.cnt > 1
order by customer_id

