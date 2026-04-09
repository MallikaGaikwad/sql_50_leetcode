-- Write your PostgreSQL query statement below
-- account id is the pk
-- each row has the monthly income for one bank account
-- to find: calculate the number of bank accounts for each salary category
-- result must contain all categories, if no accounts then 0
-- result in any order 
-- logic: write a cte to categorize the salaries and create a column "category" and then group it in the main query

select 
    'Low Salary' as category,
    count(account_id) as accounts_count
from accounts
where income < 20000

union

select 
    'Average Salary' as category,
    count(account_id) as accounts_count
from accounts
where income >= 20000 and income <= 50000

union

select 
    'High Salary' as category,
    count(account_id) as accounts_count
from accounts
where income > 50000
