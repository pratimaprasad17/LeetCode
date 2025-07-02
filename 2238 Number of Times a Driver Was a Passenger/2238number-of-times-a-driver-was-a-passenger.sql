# Write your MySQL query statement below
select distinct driver_id,
(select count(*) from Rides where passenger_id=r.driver_id) as cnt
from Rides r
group by driver_id