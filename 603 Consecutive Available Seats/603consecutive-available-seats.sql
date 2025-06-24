# Write your MySQL query statement below
select c1.seat_id
from Cinema c1
left join Cinema c2
on c2.seat_id=c1.seat_id-1
left join Cinema c3
on c3.seat_id=c1.seat_id+1
where (c2.free=1 and c1.free=1) or (c1.free=1 and c3.free=1)