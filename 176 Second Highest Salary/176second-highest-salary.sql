# Write your MySQL query statement below
with cte_rank as (
    select id,
    salary,
    dense_rank() over(order by salary desc) as rnk
    from Employee
)
select
coalesce(
    (
    select
    salary
    from cte_rank
    where rnk=2
    limit 1
    ), null) as SecondHighestSalary