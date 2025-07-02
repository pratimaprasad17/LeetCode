# Write your MySQL query statement below
with cte_ranking as (
    select 
    customer_id,
    product_id,
    dense_rank() over(partition by customer_id order by count(product_id) desc) as ranking
    from Orders
    group by customer_id, product_id
    order by customer_id
)
select 
customer_id,
cr.product_id,
product_name
from cte_ranking cr
join Products p
using(product_id)
where ranking=1