# Passed OOP course
select
(select count(*)
from course_has_student 
where course_has_student.course_idCourse=2 
and course_has_student.final >= 4) /
(select count(*)
from course_has_student as cs
where cs.course_idCourse=2) * 100
as Percentage_Passed;

# Failed Maths course

select
(select count(*)
from course_has_student
where course_has_student.course_idCourse=1
and course_has_student.final is null
xor course_has_student.final < 4) /
(select count(*)
from course_has_student
where course_has_student.course_idCourse=1) 
* 100 as Percentage_Failed;