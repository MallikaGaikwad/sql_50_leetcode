-- Write your PostgreSQL query statement below
-- person id is pk
-- turn is the order in which they will board the bus 
-- turn = 1 denotes first person to board and turn = n denotes last person
-- weight is the weight of the person in kgs
-- weight limit of bus = 1000 kgs 
-- to find: person_name of the last person that can fit on the bus weight exceeding the limit 
-- only one person can board at a turn

with moving_sum as (
select
    person_id,
    person_name,
    weight,
    turn,
    sum(weight) over (order by turn
    rows between unbounded preceding and current row) as total_weight
from queue
),

max_persons as (
select
    person_id,
    person_name,
    weight,
    turn,
    row_number() over (order by total_weight desc) as row_num
from moving_sum 
where total_weight <= 1000
)

select 
    person_name
from max_persons 
where row_num = 1
