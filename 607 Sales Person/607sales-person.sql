# Write your MySQL query statement below
-- select name from SalesPerson
-- where name not in (
--     select sp.name
--     from Orders o
--     join SalesPerson sp
--     on sp.sales_id=o.sales_id
--     left join Company c
--     on c.com_id=o.com_id
--     where c.name="RED"
--     )

select name
from SalesPerson
where sales_id not in (
    select sales_id 
    from Orders 
    where com_id not in (
        select com_id
        from Company
        where name!="RED"
    )
)