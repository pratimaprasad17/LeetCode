# Write your MySQL query statement below
with cte_tmp as (
    select *,
    case
        when order_date=customer_pref_delivery_date then "immediate"
        else "scheduled"
    end as type,
    rank() over(partition by customer_id order by order_date) as first_order
    from Delivery
)
select 
round(((select count(*) from cte_tmp where first_order=1 and type='immediate')/(select count(*) from cte_tmp where first_order=1))*100,2) as immediate_percentage
from cte_tmp
limit 1
