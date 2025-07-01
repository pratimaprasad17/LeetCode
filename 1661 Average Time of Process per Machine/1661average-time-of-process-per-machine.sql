# Write your MySQL query statement below
with cte_activity as (
    select
    a.machine_id,
    a.process_id,
    round(a.timestamp,3) as activity_start,
    round(b.timestamp,3) as activity_end,
    round((b.timestamp-a.timestamp),3) as ttc
    from Activity a
    join Activity b
    on a.machine_id=b.machine_id
    and a.process_id=b.process_id
    and a.activity_type='start'
    and b.activity_type='end'
)
select 
machine_id,
round(sum(ttc)/count(*),3) as processing_time
from cte_activity
group by machine_id