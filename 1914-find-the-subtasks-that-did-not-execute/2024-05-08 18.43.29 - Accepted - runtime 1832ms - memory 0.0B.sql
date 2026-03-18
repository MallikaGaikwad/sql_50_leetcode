# Write your MySQL query statement below

with recursive cte as (select task_id, 1 as subtask_id
                        from tasks
                        union all
                        select task_id, subtask_id + 1
                        from cte 
                        where subtask_id < (select subtasks_count
                                            from tasks
                                            where task_id = cte.task_id))

select * 
from cte
where (task_id, subtask_id) not in (select * from executed)
