# Write your MySQL query statement below
with cte as (select p.group_id, p.player_id, m.first_score as score
                from players p
                join matches m
                on p.player_id = first_player
                union all
                select p.group_id, p.player_id, m.second_score as score
                from players p
                join matches m
                on p.player_id = second_player),
    cte2 as (select group_id, player_id, sum(score) as tot_score
                from cte
                group by 1, 2)

select distinct group_id, 
        first_value(player_id) over(partition by group_id order by tot_score desc, player_id) as player_id
from cte2





