# 1.Query the existence of 1 course
select * from course where id = 1;

# 2.Query the presence of both 1 and 2 courses
select * from
(select * from student_course where courseId = 1) as sc1 join (select * from student_course where courseId = 2) as sc2
on sc1.studentId = sc2.studentId; 

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select s.id, s.name, avg(score) avgScore
from student_course sc left join student s
on sc.studentId = s.id
group by sc.studentId
having avgScore >= 60;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
select distinct * from student s where s.id not in (select distinct sc.studentId from student_course sc);

# 5.Query all SQL with grades
select distinct * from student s where s.id in (select distinct sc.studentId from student_course sc);

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select s.* from student s, student_course sc where s.id = 1 and sc.courseId = 2 and s.id = sc.studentId;

# 7.Retrieve 1 student score with less than 60 scores in descending order
select s.id, score 
from student s, student_course sc 
where s.id = sc.studentId and s.id = 1 and sc.score < 60 order by score desc;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select courseId, (score) avg from student_course sc group by courseId order by avg desc, courseId asc;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select s.name, score from student s, course c, student_course sc 
where s.id = sc.studentId and c.id = sc.courseId and c.name = 'Math' and score < 60;
