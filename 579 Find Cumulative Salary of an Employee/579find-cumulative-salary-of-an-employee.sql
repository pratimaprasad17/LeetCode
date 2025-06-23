# Write your MySQL query statement below
with cte_rn as(
    select *, row_number() over(partition by id order by month desc) as rn
        from Employee
)
select
e1.id,
e1.month,
ifnull(e1.salary, 0)+ ifnull(e2.salary, 0)+ ifnull(e3.salary, 0) as Salary
from cte_rn e1
left join Employee e2
on e1.id=e2.id and e2.month=e1.month-1 
left join Employee e3
on e1.id = e3.id and e3.month=e1.month-2
where e1.rn>1
order by e1.id asc, e1.month desc