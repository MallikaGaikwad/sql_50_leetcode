-- Write your PostgreSQL query statement below
-- playerid and event date is primary key so will be unique throughtout
-- one row per player and eventdate
-- to find: players who logged in on their day one + 1 / total players
-- technical terms: row_num =2 event_date = row_num 1 event_date +1 

with initial_login as (
select 
    player_id,
    event_date,
    row_number() over (partition by player_id order by event_date) as row_num,
    lead(event_date) over (partition by player_id order by event_date) as next_login
from activity
)

select
    round(
        1.0 * count(player_id) 
        / 
        (select count(distinct player_id) from activity)
        ,2) as fraction
from initial_login
where event_date + 1 = next_login and row_num =1