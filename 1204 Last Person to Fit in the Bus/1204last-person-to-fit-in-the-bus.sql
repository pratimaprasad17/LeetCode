# Write your MySQL query statement below
with weight_sum as (    
    select
    person_name,
    sum(weight) over(order by turn) as turn_weight
    from Queue
) 
select person_name
from weight_sum
where turn_weight<=1000
order by turn_weight desc
limit 1