# Write your MySQL query statement below
with cte_ranking as (
    select product_id, user_id,
    dense_rank() over(partition by user_id order by sum(quantity)*price desc) as ranking
    from Sales s
    left join Product p
    using(product_id)
    group by user_id, product_id
)
select 
user_id, product_id
from cte_ranking
where ranking=1