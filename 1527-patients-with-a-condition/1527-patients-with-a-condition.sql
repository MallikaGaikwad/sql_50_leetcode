-- Write your PostgreSQL query statement below
-- patient id is the pk, so one record per patient with one conditions

select 
    patient_id,
    patient_name, 
    conditions
from patients 
where conditions LIKE 'DIAB1%' or conditions LIKE '% DIAB1%'