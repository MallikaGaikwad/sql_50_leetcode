# Write your MySQL query statement below
with cte as (select host_team as team,
                    CASE
                        when host_goals > guest_goals then 3
                        when host_goals = guest_goals then 1
                        else 0
                    END as goals
            from matches
            Union all
            select guest_team as team,
                    CASE
                        when host_goals < guest_goals then 3
                        when host_goals = guest_goals then 1
                        else 0
                    END as goals
            from matches)

select t.team_id, t.team_name, ifnull(sum(c.goals), 0) as num_points
from cte c
right join teams t
on c.team = t.team_id
group by t.team_id
order by 3 desc, 1

