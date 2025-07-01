# Write your MySQL query statement below
with cte_result as (
    select product_id, 'store1' as store, store1 as price from Products
    UNION ALL
    select product_id, 'store2' as store, store2 as price from Products
    UNION ALL
    select product_id, 'store3' as store, store3 as price from Products
)
select * from cte_result where not isnull(price)