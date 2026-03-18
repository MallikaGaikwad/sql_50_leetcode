# Write your MySQL query statement below
select distinct l.page_id as recommended_page
from likes l
join (select user2_id as friends
        from friendship
        where user1_id = 1
        union
        select user1_id as friends
        from friendship
        where user2_id = 1) as t
on l.user_id = t.friends
where l.page_id not in (select page_id from likes
                        where user_id = 1)
