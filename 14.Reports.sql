-------------Reports---------------------------
------1) Popular Course --------------------------
Select count(student_id)as total_students, course_id, course_name from VW_Popular_Course GROUP BY course_id,course_name;
--Select * from(Select count(student_id)as total_students, course_id, course_name from VW_Popular_Course GROUP BY course_id,course_name)where ROWNUM<=30;



---------2) Popular Professor--------------------------------
Select count (student_id) as Total_students, prof_name from VW_Popular_Prof group by prof_id, prof_name order by total_students desc;



----------3) Grade Report of a student--------------------
Select * from(SELECT Student_id, Course_name,Grade from VW_Student_Grade where student_id=4000);
----------4) Student's Fee Information--------------------
Select Fee_status, amount, semester, course_id from VW_Student_Fee where student_id = 4000;
-----------5) Students enrolled for a course in a particular semester------------

Select count(student_id) as total_students, course_name, semester from VW_Student_Enroll where semester = 'SPRING' AND (course_id between 300 and 305)
GROUP BY semester,course_name;