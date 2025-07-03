# Write your MySQL query statement below
-- select 
-- customer_id,
-- row_number() over(order by customer_id) as row_num
-- from Customers

with recursive seq as (
    select 1 as value
    union all
    select value + 1
    from seq
    where value < (select max(customer_id) from Customers)
)
select value as ids from seq
where value not in (select customer_id from Customers)

