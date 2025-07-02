# Write your MySQL query statement below
select
t1.employee_id
-- t2.employee_id as t2_emp_id,
-- t3.employee_id as t3_emp_id,
-- t4.employee_id as t4_emp_id
from Employees t1
join Employees t2
on t1.manager_id=t2.employee_id
join Employees t3
on t2.manager_id=t3.employee_id
join Employees t4
on t3.manager_id=t4.employee_id
where t4.employee_id=1 and t1.employee_id!=1