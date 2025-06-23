# Write your MySQL query statement below
-- select name
-- from Customer
-- where referee_id != 2 or isnull(referee_id)

select e1.name 
from Customer e1
left join Customer e2
on e1.referee_id=e2.id
where isnull(e1.referee_id) or e1.referee_id!=2