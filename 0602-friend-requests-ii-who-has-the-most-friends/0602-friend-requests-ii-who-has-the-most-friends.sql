-- Write your PostgreSQL query statement below
-- req id and accept id is PK so the combo of them has one date 
-- to find: ids who have the most friends and their count
-- we need requester_id where the acceptor_id has max unique count

with count_all as (
select
    requester_id as id,
    count(distinct accepter_id) as count
from requestaccepted 
group by requester_id

union all

select 
    accepter_id as id,
    count(distinct requester_id) as count
from requestaccepted 
group by accepter_id
),

rank_id as (
select 
    id,
    sum(count) as num,
    rank() over (order by sum(count) desc) as rank
from count_all
group by id
)

select 
    id, 
    num
from rank_id
where rank = 1


