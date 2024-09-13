# Write your MySQL query statement below
-- select ss.student_id, ss.student_name, ss.subject_name, count(distinct e.subject_name) as attended_exams
-- from (select * from Students, Subjects) as ss 
-- left join Examinations e on ss.student_id=e.student_id 
-- group by ss.student_id, ss.subject_name
-- order by ss.student_id, ss.subject_name;


select s.student_id, s.student_name, sub.subject_name, ifnull(attended_exams, 0) as attended_exams
from Students s
cross join
Subjects sub
left join (
    select student_id, subject_name, count(*) as attended_exams
    from Examinations
    group by student_id, subject_name
) grouped_e
on s.student_id=grouped_e.student_id and sub.subject_name=grouped_e.subject_name
order by s.student_id, sub.subject_name;