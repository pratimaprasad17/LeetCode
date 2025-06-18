# Write your MySQL query statement below
with cte as(
    select t.id, 
    t.client_id, 
    t.driver_id, 
    t.status, 
    t.request_at, 
    (select banned from Users u where u.users_id=t.client_id) as client_status,
    (select banned from Users u where u.users_id=t.driver_id) as driver_status,
    dense_rank() over(order by t.request_at) as day
    from Trips t
    where t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
)
select 
request_at as 'Day',
-- client_status,
-- driver_status,
round((coalesce(sum(status in ('cancelled_by_driver', 'cancelled_by_client')), 0)/count(*)),2) as 'Cancellation Rate'
from cte
where client_status != 'Yes' and driver_status != 'Yes'
group by day

