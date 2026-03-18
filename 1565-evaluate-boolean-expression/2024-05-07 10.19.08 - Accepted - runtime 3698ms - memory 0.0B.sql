# Write your MySQL query statement below
with cte as (select e.*, 
                v0.value as left_value,
                v1.value as right_value
            from expressions e
            left join variables v0 on e.left_operand = v0.name
            left join variables v1 on e.right_operand = v1.name)

select left_operand,
        operator,
        right_operand,
        CASE
            when operator = ">" then if(left_value > right_value, "true", "false")
            when operator = "<" then if(left_value < right_value, "true", "false")
            when operator = "=" then if(left_value = right_value, "true", "false")
        END as value
from cte

