with consecutive_days as(
    select 
    a.customer_id,
    a.transaction_date
    from Transactions a
    join Transactions b
    on a.customer_id=b.customer_id
    and b.amount>a.amount
    and datediff(b.transaction_date, a.transaction_date)=1
),
assigned_rows as (
    select
    customer_id,
    transaction_date,
    row_number() over(partition by customer_id order by transaction_date) as row_num
    from consecutive_days
),
grouping_transactions as (
    select
    customer_id,
    transaction_date,
    date_sub(transaction_date, interval row_num day) as group_identifier
    from assigned_rows
),
count_transactions as (
    select
    customer_id,
    min(transaction_date) as consecutive_start,
    count(*) as trans_count
    from grouping_transactions
    group by customer_id, group_identifier 
)
select
customer_id,
consecutive_start,
date_add(consecutive_start, interval trans_count day) as consecutive_end
from count_transactions
where trans_count>1
order by customer_id, consecutive_start, consecutive_end