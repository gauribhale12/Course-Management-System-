
SET SERVEROUTPUT ON;
Create or Replace Function create_views(str Varchar2)
Return varchar2
is
Begin
---9)--------View for popular course----------------------------------------------------------- Done
EXECUTE IMMEDIATE q'!Create or replace view VW_Popular_Course as
SELECT
     a.course_id,
     a.course_name,
     a.prog_id,
     b.Student_id
     From Course a join Student b ON a.prog_id = b.prog_id!';
    
 EXECUTE IMMEDIATE q'!Select count(student_id)as total_students, course_id, course_name from VW_Popular_Course GROUP BY course_id,course_name!';

---8)------------------------------------View for popular professor-----------------------------------------------Done
EXECUTE IMMEDIATE q'!Create or replace view VW_Popular_Prof as
Select 
S.student_id,
Pr.Prof_id,
Pr.Prof_name,
Pr.Dept_id,
P.Prog_id, 
Co.Course_id,
Co.Course_name 
FROM Professor Pr JOIN Program P ON Pr.dept_id = P.dept_id
Left JOIN course Co ON P.Prog_id = Co.Prog_id
join Student S on P.prog_id = S.prog_id
order by Co.course_id!';
EXECUTE IMMEDIATE q'!Select * From  VW_Popular_Prof!';


---7)-------------------------------------------View for Professor Department Info--------------------------------- Done
EXECUTE IMMEDIATE q'!Create or replace view VW_Prof_Dept_Info as
Select Professor.Prof_id, Professor.Prof_name, Professor.Dept_id
From Professor
Group By Professor.Prof_id, Professor.Prof_name, Professor.Dept_id
order by Professor.Prof_id, Professor.Prof_name asc!';
EXECUTE IMMEDIATE q'!Select * from VW_Prof_Dept_Info!';

-----6)----------------------------------------View for students enrolled in a particular program--------------------------------- Done
EXECUTE IMMEDIATE q'!Create or replace view VW_Student_Enrollment as
Select Student.Student_id, Student.Student_name, Student.Prog_id
From Student
Group By Student.Student_id, Student.Student_name, Student.Prog_id
order by  Student.Student_id, Student.Student_name asc!';
EXECUTE IMMEDIATE q'!Select * from VW_Student_Enrollment!';
-----5)----------------------------------------------View for Program under each department------------------------------------ Done
EXECUTE IMMEDIATE q'!Create or replace view VW_Dept_Prog as
Select Program.Prog_id, Program.Program_name, Program.Dept_id
From Program
Group By Program.Prog_id, Program.Program_name, Program.Dept_id
order by Program.Prog_id, Program.Program_name asc!';
EXECUTE IMMEDIATE q'!Select* from VW_Dept_Prog!';
----4)--------------------------------------------------- View for Student Grade------------------------------------------------Done
EXECUTE IMMEDIATE q'!Create or replace view VW_Student_Grade AS
Select  
G.Grade_id, 
G.Grade,
R.student_id,
R.class_id,
C.Semester,
C.Course_id,
PS.Prof_id,
Co.Course_name,
P.prof_name
FROM 
Grade G left join Registration R on  G.registration_id = R.registration_id 
join Class C on r.Class_id = c.class_id
join Professor_schedule PS on c.schedule_id = ps.schedule_id
join Course Co on C.course_id = Co.course_id
join Professor P on PS.prof_id = P.prof_id
order by grade_id desc!';
EXECUTE IMMEDIATE q'!Select * From VW_Student_Grade!';
----Select query to be written
-----3)-----------------------------------------------------------View for Student Fee Info------------------------------------------Done
EXECUTE IMMEDIATE q'!Create or replace view VW_Student_Fee as
Select 
R.Student_id,
R.Registration_id,
R.class_id, 
F.Fee_id, 
F.Amount, 
F.Fee_status,
cls.semester,
cls.course_id
FROM 
Fee F join Registration R on f.registration_id = r.registration_id
join Class cls on r.class_id = cls.class_id!';

EXECUTE IMMEDIATE q'!Select * From  VW_Student_Fee!';
----2)-------------------------------------------------View for Professor assigned to Course----------------------------------------------Done
EXECUTE IMMEDIATE q'!Create or replace view VW_Prof_Course as
Select Pr.Prof_id,
Pr.Prof_name,
Pr.Dept_id,
P.Prog_id, 
Co.Course_id,
Co.Course_name 
FROM Professor Pr JOIN Program P ON Pr.dept_id = P.dept_id
Left JOIN course Co ON P.Prog_id = Co.Prog_id
order by Co.course_id!';
EXECUTE IMMEDIATE q'!Select * From VW_Prof_Course!';

----------------------------View for enrolled student for a particular course in a semester------------------------------------Done
EXECUTE IMMEDIATE q'! Create or replace view VW_Student_Enroll as
Select
R.Registration_id, 
R.student_id,
Cls.Class_id, 
Cls.Semester, 
Cls.course_id,
Co.course_name,
Co.prog_id
FROM Registration R
join Class Cls on r.class_id = cls.class_id
join Course Co on cls.course_id = co.course_id
order by co.prog_id!';
EXECUTE IMMEDIATE q'!Select * From  VW_Student_Enroll!';
commit;


Return str;
Exception
When others then
DBMS_OUTPUT.put_line ('Exception handled view not created');
END;
/




DECLARE
str varchar2(100);
BEGIN
str := create_views('create_views called');
DBMS_OUTPUT.put_line (str);
END;
/
