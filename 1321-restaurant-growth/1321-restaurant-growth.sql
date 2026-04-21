-- Write your PostgreSQL query statement below
-- customer id and visited on are pk so one customer could have one entry per day
-- no same day multiple entries
-- to find: moving average of 7 days on every day and order by visited on

select
    visited_on,
    amount,
    average_amount
from (
select
    visited_on,
    sum(sum(amount)) over
    (order by visited_on rows between 6 preceding and current row) as amount,
    round(avg(sum(amount)) over
    (order by visited_on rows between 6 preceding and current row),2) as average_amount
from customer
group by visited_on
)
where visited_on >= (select min(visited_on) + 6 from customer)
order by visited_on asc