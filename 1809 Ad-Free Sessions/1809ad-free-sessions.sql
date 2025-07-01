# Write your MySQL query statement below
select
session_id
from Playback p
left join Ads a
on p.customer_id=a.customer_id and timestamp between start_time and end_time
where (ad_id) is null