# Write your MySQL query statement below
with cte_rank as (
    select id, name, departmentId, salary,
    dense_rank() over(partition by departmentId order by salary desc) as rnk
    from Employee
)
select
d.name as Department,
cr.name as Employee,
salary as Salary
from cte_rank cr
join Department d
on cr.departmentId = d.id
where rnk=1