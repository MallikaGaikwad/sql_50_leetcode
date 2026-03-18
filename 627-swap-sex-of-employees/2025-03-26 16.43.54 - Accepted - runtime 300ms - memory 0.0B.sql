# Write your MySQL query statement below
UPDATE SALARY
SET sex = CASE
    WHEN SEX = 'm' THEN 'f'
    WHEN SEX = 'f' THEN 'm'
    END;