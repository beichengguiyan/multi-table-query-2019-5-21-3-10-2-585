# 1.查询同时存在1课程和2课程的情况
SELECT *
FROM student_course
WHERE courseId = 1 OR courseId = 2
GROUP BY studentId
HAVING COUNT(*) = 2 
# 2.查询同时存在1课程和2课程的情况
SELECT *
FROM student_course
WHERE courseId = 1 OR courseId = 2
GROUP BY studentId
HAVING COUNT(*) = 2 
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
SELECT studentId,name,AVG(score) AS avg_score
FROM student_course,student
WHERE studentId = id
GROUP BY studentId
HAVING avg_score>=60
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
SELECT student.*
FROM student_course,student
WHERE score IS NULL AND student_course.studentId = student.id
# 5.查询所有有成绩的SQL
SELECT *
FROM student_course
WHERE score IS NOT NULL
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
SELECT student.*
FROM student_course,student
WHERE (courseId = 1 OR courseId = 2) AND studentId=id
GROUP BY studentId
HAVING COUNT(*) = 2 
# 7.检索1课程分数小于60，按分数降序排列的学生信息
SELECT student.*,score
FROM student_course,student
WHERE courseId =1 AND score < 60 AND studentId=id
ORDER BY score DE
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
SELECT courseId,AVG(score)
FROM student_course
GROUP BY courseId
ORDER BY AVG(score) DESC,courseId
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
SELECT student.name,student_course.score
FROM student_course,student,course
WHERE course.name = "数学" 
AND student_course.score < 60
AND course.id = student_course.courseId
AND student.id = student_course.studentId