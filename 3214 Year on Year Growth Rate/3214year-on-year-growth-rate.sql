# Write your MySQL query statement below
with joined as (
    select
    year(transaction_date) as year,
    product_id,
    sum(spend) as spend
    from user_transactions
    group by product_id, year(transaction_date)
)
select
a.year,
a.product_id,
a.spend as curr_year_spend,
b.spend as prev_year_spend,
round((a.spend-b.spend)/b.spend*100.00,2) as yoy_rate
from joined a
left join joined b
on a.product_id=b.product_id
and a.year=b.year+1
order by product_id, year