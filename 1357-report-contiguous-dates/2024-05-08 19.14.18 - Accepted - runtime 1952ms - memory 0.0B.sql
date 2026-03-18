# Write your MySQL query statement below
with cte1 as (select success_date,
                row_number() over(order by success_date) as rn
                from succeeded
                where success_date between "2019-01-01" and "2019-12-31"
                ),
    success_groups as (select "succeeded" as period_state,
                        min(success_date) as start_date,
                        max(success_date) as end_date
                        from cte1
                        group by to_days(success_date) - rn),
    cte2 as (select fail_date,
                row_number() over(order by fail_date) as rn
                from failed
                where fail_date between "2019-01-01" and "2019-12-31"
                ),
    fail_groups as (select "failed" as period_state,
                        min(fail_date) as start_date,
                        max(fail_date) as end_date
                        from cte2
                        group by to_days(fail_date) - rn)


select * from success_groups
union all
select * from fail_groups
order by start_date
