# Write your MySQL query statement below
with cte_first as (
    select
    row_number() over() as row_num,
    first_col
    from Data
    order by first_col
),
cte_second as (
    select
    row_number() over() as row_num,
    second_col
    from Data
    order by second_col desc
)
select first_col, second_col
from cte_first
join cte_second
using(row_num)