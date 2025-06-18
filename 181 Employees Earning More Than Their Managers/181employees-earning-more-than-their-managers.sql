# Write your MySQL query statement below

-- with cte_employee as (
--     select e1.id,
--         e1.name,
--         e1.salary,
--         e1.managerId,
--         (select name from Employee as e2 where e1.managerId=e2.id) as managerName,
--         (select salary from Employee as e3 where e1.managerId=e3.id) as managerSalary
--     from Employee as e1
-- )
-- select name as Employee from cte_employee where salary>managerSalary

select 
e1.name as Employee
from Employee e1
join Employee e2
on e2.id=e1.managerId
where e1.salary>e2.salary