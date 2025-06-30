# Write your MySQL query statement below
with cte_order as (
    select 
    product_id,
    sum(unit) as unit
    from Orders
    where order_date like '2020-02%'
    group by product_id
    having sum(unit)>=100
)
select product_name, unit 
from Products p
join cte_order co
on p.product_id=co.product_id