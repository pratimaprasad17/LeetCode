# Write your MySQL query statement below
with salary as (
    select name, salary, departmentId,
    dense_rank() over (partition by departmentId order by salary desc) as ranked
    from Employee
)
select d.name as Department,
s.name as Employee,
s.salary as Salary
from salary s
left join department d
on s.departmentId=d.id
where ranked in (1,2,3)