# Write your MySQL query statement below
with t1 as (
    select year,
    Wimbledon as winner
    from Championships
    union all
    select year,
    Fr_open as winner
    from Championships
    union all
    select year,
    US_open as winner
    from Championships
    union all
    select year,
    Au_open as winner
    from Championships
)
select winner as player_id, p.player_name, count(*) as grand_slams_count
from t1
join Players p
on t1.winner=p.player_id
group by winner