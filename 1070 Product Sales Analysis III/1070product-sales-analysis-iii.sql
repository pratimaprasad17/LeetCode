# Write your MySQL query statement below
with cte_rank as (
    select *,
    rank() over(partition by product_id order by year) as r
    from Sales 
)
select product_id, year as first_year, quantity, price
from cte_rank
where r=1

