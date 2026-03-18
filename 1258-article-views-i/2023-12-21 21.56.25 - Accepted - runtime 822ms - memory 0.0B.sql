# Write your MySQL query statement below
SELECT DISTINCT author_id AS id
FROM Views
where author_id = Viewer_id
ORDER BY author_id ASC