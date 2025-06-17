# Write your MySQL query statement below
select e.employee_id
from Employees as e left join Salaries as s using(employee_id)
where ISNULL(e.name) OR ISNULL(s.salary)

union
select s.employee_id
from Salaries as s left join Employees as e using(employee_id)
where ISNULL(e.name) OR ISNULL(s.salary)

order by employee_id