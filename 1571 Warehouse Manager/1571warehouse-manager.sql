# Write your MySQL query statement below
with cte_volume as (
    select 
    product_id,
    product_name,
    (Width*Length*Height) as product_vol
    from Products
)
select 
name as warehouse_name, 
sum(units*product_vol) as volume
from warehouse
join cte_volume 
using (product_id)
group by name
