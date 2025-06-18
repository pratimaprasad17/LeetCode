# Write your MySQL query statement below
with temp_cmp as (
    select id,
    recordDate,
    temperature as t1,
    case
        when subdate(recordDate,1) = lag(recordDate,1) over() then 1
        else 0
    end as if_consecutive,
    lag(temperature, 1) over() as t2
    from Weather
    order by recordDate
)
-- select * from temp_cmp
select id from temp_cmp
where t1>t2 and if_consecutive=1