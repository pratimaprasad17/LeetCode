# Write your MySQL query statement below
select q.id, q.year, coalesce(npv.npv, 0) as npv
from Queries q 
left join NPV npv
on npv.id = q.id and npv.year = q.year