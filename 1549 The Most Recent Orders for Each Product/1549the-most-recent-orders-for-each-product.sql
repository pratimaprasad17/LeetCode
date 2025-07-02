# Write your MySQL query statement below
with cte_rank as (
    select
    product_id,
    order_id,
    order_date,
    dense_rank() over(partition by product_id order by order_date desc) as ranking
    from Orders
)
select product_name,
cr.product_id,
order_id,
order_date
from cte_rank cr
join Products p
using(product_id)
where ranking=1
order by product_name, cr.product_id, order_id
