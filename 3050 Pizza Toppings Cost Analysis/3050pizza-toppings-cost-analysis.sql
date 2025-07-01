# Write your MySQL query statement below
with cte_rank as (
    select 
    t1.topping_name as top1,
    t2.topping_name as top2,
    t3.topping_name as top3,
    t1.cost+t2.cost+t3.cost as total_cost
    from Toppings t1
    join Toppings t2 on t1.topping_name<t2.topping_name
    join Toppings t3 on t2.topping_name<t3.topping_name
)
select concat(top1,',',top2,',',top3) as pizza,
round(total_cost,2) as total_cost
from cte_rank
order by total_cost desc, pizza