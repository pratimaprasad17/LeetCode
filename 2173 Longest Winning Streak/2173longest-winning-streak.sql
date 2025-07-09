# Write your MySQL query statement below
with ranked_matches as (
    select
    player_id,
    match_day,
    result,
    case when result='Win' then 0 else 1 end as not_win,
    row_number() over(partition by player_id order by match_day) - row_number() over(partition by player_id, result order by match_day) as streak_group
    from Matches
),
streaks as (
    select player_id, 
    not_win,
    sum(1-not_win) over(partition by player_id, streak_group order by match_day) as streak_length
    from ranked_matches
)
select player_id,
max(case when not_win =0 then streak_length else 0 end) as longest_streak
from streaks
group by player_id