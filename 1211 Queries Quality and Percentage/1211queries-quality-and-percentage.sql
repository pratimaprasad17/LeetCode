# Write your MySQL query statement below
select query_name, 
round((sum(rating/position)/count(rating)),2) as quality, 
round((avg(if(rating<3,1,0)))*100,2) as poor_query_percentage
from Queries
where !isnull(query_name)
group by query_name