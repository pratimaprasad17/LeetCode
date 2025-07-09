# Write your MySQL query statement below
select 
item_category as CATEGORY,
sum(case when dayname(order_date)="Monday" then quantity else 0 end) as MONDAY,
sum(case when dayname(order_date)="Tuesday" then quantity else 0 end) as TUESDAY,
sum(case when dayname(order_date)="Wednesday" then quantity else 0 end) as WEDNESDAY,
sum(case when dayname(order_date)="Thursday" then quantity else 0 end) as THURSDAY,
sum(case when dayname(order_date)="Friday" then quantity else 0 end) as FRIDAY,
sum(case when dayname(order_date)="Saturday" then quantity else 0 end) as SATURDAY,
sum(case when dayname(order_date)="Sunday" then quantity else 0 end) as SUNDAY
from Items i
left join Orders o
using(item_id)
group by item_category
order by item_category