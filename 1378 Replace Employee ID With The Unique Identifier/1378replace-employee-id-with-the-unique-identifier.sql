# Write your MySQL query statement below
select unique_id, name
from Employees e
left join EmployeeUNI e_uni
on e.id=e_uni.id