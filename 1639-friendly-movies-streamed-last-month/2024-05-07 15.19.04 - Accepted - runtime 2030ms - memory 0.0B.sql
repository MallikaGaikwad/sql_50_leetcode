# Write your MySQL query statement below
select distinct c.title
from content c
Join tvprogram tv
on c.content_id = tv.content_id and  tv.program_date like "2020-06%" and c.kids_content = "Y" and c.content_type = "Movies"

