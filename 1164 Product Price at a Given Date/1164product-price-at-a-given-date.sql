# Write your MySQL query statement below
with cte_rank as(
    select *,
    rank() over(partition by product_id order by change_date desc) as r
    from Products 
    where change_date<='2019-08-16'
)
select distinct p.product_id,
coalesce(cte_rank.new_price, 10) as price
from Products p
left join cte_rank
on p.product_id=cte_rank.product_id
where cte_rank.r=1 or isnull(cte_rank.r)