# Write your MySQL query statement below
select
id,
case 
    when isnull(p_id) then "Root" 
    when id not in (select distinct p_id from Tree where p_id is not null) then "Leaf"
    else "Inner"
end as type
from Tree