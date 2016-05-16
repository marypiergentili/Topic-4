select course.name as Course, concat(teacher.lastName, ", ", teacher.firstName) as Teacher, concat(student.lastName, ",", student.firstName) as student
from course, teacher, student, course_has_teacher, course_has_student
where course.idCourse=2 
and course_has_student.course_idCourse=2
and course.idCourse=course_has_teacher.course_idCourse
and teacher.idTeacher=course_has_teacher.teacher_idTeacher
and student.registrationNumber=course_has_student.student_registrationNumber
order by Student;
