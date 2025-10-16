# Write your MySQL query statement below
select
firstName,
lastName,
ifnull(city, null) as city,
ifnull(state,null) as state
from Person p
left join Address a
using(personId)