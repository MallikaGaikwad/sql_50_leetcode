# Write your MySQL query statement below
select t.*, count(*) as grand_slams_count
from (select p.*
        from players p
        join championships c1
        on p.player_id = c1.Wimbledon
        union all
        select p.*
        from players p
        join championships c2
        on p.player_id = c2.Fr_open
        union all
        select p.*
        from players p
        join championships c3
        on p.player_id = c3.US_open
        union all
        select p.*
        from players p
        join championships c4
        on p.player_id = c4.Au_open) as t
group by t.player_id

 
