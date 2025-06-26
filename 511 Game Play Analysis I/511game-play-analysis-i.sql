# Write your MySQL query statement below
with cte_rank as (
    select *,
    rank() over(partition by player_id order by event_date) as r
    from Activity
)
select player_id, event_date as first_login
from cte_rank
where r=1