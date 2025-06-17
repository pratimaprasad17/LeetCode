# Write your MySQL query statement below
select
firstName,
lastName,
-- IFNULL(city, null) as 
city,
-- IFNULL(state, null) as 
state
from Person left join Address using(personId)
