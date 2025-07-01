# Write your MySQL query statement below
-- select 
-- id,
-- sum(if(month="Jan", revenue, null)) as Jan_Revenue,
-- sum(if(month="Feb", revenue, null)) as Feb_Revenue
-- from Department
-- group by id

select
id,
max(case when month='Jan' then revenue end) as Jan_revenue,
max(case when month='Feb' then revenue end) as Feb_revenue,
max(case when month='Mar' then revenue end) as Mar_revenue,
max(case when month='Apr' then revenue end) as Apr_revenue,
max(case when month='May' then revenue end) as May_revenue,
max(case when month='Jun' then revenue end) as Jun_revenue,
max(case when month='Jul' then revenue end) as Jul_revenue,
max(case when month='Aug' then revenue end) as Aug_revenue,
max(case when month='Sep' then revenue end) as Sep_revenue,
max(case when month='Oct' then revenue end) as Oct_revenue,
max(case when month='Nov' then revenue end) as Nov_revenue,
max(case when month='Dec' then revenue end) as Dec_revenue
from Department
group by id