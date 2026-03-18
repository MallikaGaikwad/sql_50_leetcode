# Write your MySQL query statement below
select ifnull(round((select count(distinct requester_id, accepter_id) 
                from requestaccepted) /
             (select count(distinct sender_id, send_to_id)
                from friendrequest)
            ,2), 0.00) as accept_rate
from dual
