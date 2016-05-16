select concat(t.lastName, ', ', t.firstName) as Teacher,
concat(s.day, '   ', s.startTime, '   ', s.finishTime) as Schedule,
c.name as Course
from teacher as t, schedule as s, course_has_schedule as cs, course as c,
course_has_teacher as ct
where t.idTeacher=ct.teacher_idTeacher
and ct.course_idCourse=c.idCourse 
and c.idCourse=cs.course_idCourse
and s.idSchedule=cs.schedule_idschedule
and t.idTeacher=1
order by s.dayNumber, s.startTime;
