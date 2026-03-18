# Write your MySQL query statement below
Select p.firstName, p.lastName, ad.city, ad.state
from Person p 
left Join Address ad
on p.personId = ad.personId