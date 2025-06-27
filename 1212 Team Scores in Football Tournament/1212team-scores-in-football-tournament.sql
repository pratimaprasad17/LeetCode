# Write your MySQL query statement below
-- with cte_teams as (
--     select match_id,
--     case
--         when host_goals>guest_goals then host_team
--         when host_goals<guest_goals then guest_team
--         else 1
--     end as winning_team
--     from Matches
-- )
-- select *,
--  from cte_teams

select team_id, team_name,
sum(case when team_id=host_team and host_goals>guest_goals then 3 else 0 end)+sum(case when team_id=guest_team and guest_goals>host_goals then 3 else 0 end)+sum(case when team_id=host_team and host_goals=guest_goals then 1 else 0 end)+sum(case when team_id=guest_team and host_goals=guest_goals then 1 else 0 end)
as num_points
from Teams
left join Matches
on team_id=host_team or team_id=guest_team
group by team_id
order by num_points desc, team_id