# Write your MySQL query statement below
select
customer_id,
count(*) as count_no_trans
from Visits v
left join Transactions t
using (visit_id)
where isnull(transaction_id)
group by customer_id