# Write your MySQL query statement below
with first_login as (
    select *,
    rank() over(partition by player_id order by event_date) as rnk
    from Activity 
)
select
round(count(a1.player_id)/(select count(distinct player_id) from Activity a3),2) as fraction
from first_login a1
join Activity a2
on a1.player_id=a2.player_id and 
datediff(a2.event_date, a1.event_date)=1
where rnk=1