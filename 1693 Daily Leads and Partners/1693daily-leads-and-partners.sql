# Write your MySQL query statement below
SELECT date_id,make_name,
count(distinct lead_id) as 'unique_lead',
count(distinct partner_id) as 'unique_partners'
from DailySales
group by date_id, make_name;