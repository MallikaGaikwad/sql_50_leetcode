# Write your MySQL query statement below

SELECT v.customer_id, count(v.visit_id) as count_no_trans
FROM visits as v
LEFT JOIN transactions as t
ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id

-- SELECT customer_id, count(visit_id) as count_no_trans
-- FROM visits
-- WHERE visit_id NOT IN (
--     select visit_id from transactions
-- )
-- GROUP BY customer_id

