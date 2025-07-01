# Write your MySQL query statement below
select 
user_id,
sum(quantity*price) as spending
from Sales s
left join Product p
using (product_id)
group by user_id
order by spending desc, user_id asc