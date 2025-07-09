# Write your MySQL query statement below
select period_state, min(date) as start_date, max(date) as end_date
from (
    select period_state, date, rank() over(order by date) as ovrl_rnk, rnk, (rank() over(order by date) - rnk) as interv
    from(
        select "failed" as period_state, fail_date as date, rank() over(order by fail_date) as rnk 
        from Failed
        where fail_date between '2019-01-01' and '2019-12-31'
        union all 
        select "succeeded" as period_state, success_date as date, rank() over(order by success_date) as rnk 
        from Succeeded
        where success_date between '2019-01-01' and '2019-12-31'
    ) as t0
) t1
group by interv, period_state
order by start_date
