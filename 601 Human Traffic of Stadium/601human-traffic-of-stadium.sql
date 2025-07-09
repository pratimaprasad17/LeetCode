# Write your MySQL query statement below
with cte_rnk as (
    select id, visit_date, people, rnk, (id-rnk) as island
    from (
    select 
    id,
    visit_date,
    people,
    rank() over(order by id) as rnk
    from Stadium
    where people>=100) as t0
)
select id, visit_date, people
from cte_rnk
where island in (
    select island 
    from cte_rnk
    group by island
    having count(*)>=3
)
order by visit_date