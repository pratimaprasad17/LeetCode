# Write your MySQL query statement below
-- with cte_rank as(
--     select
--     id,
--     num,
--     lead(num) over() as num_1,
--     lead(num, 2) over() as num_2
--     from Logs
-- )
-- select
-- distinct num as ConsecutiveNums 
-- from cte_rank
-- where num=num_1 and num=num_2

select
distinct l1.num as ConsecutiveNums 
from Logs l1, logs l2, logs l3
where l1.id=l2.id-1 and l2.id=l3.id-1
and l1.num=l2.num and l2.num=l3.num