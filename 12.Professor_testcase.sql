-- Professor grant test case

-- Professor insert test case
Select * from Course_Management_Admin.professor_schedule;

Insert into Course_Management_Admin.professor_schedule values(2056,1003,'Monday',to_char(to_date('27-SEP-2001 17:50:00','dd-mm-yyyy HH24:MI:SS'),'HH24:MI:SS AM'),4,'AVAILABLE');
commit;
Select * from Course_Management_Admin.professor_schedule;

-- Professor delete test case
Select * from Course_Management_Admin.class;
Delete from Course_Management_Admin.Professor_Schedule where Schedule_id =2056 AND Status='AVAILABLE';
commit;
Select * from Course_Management_Admin.professor_schedule;

--Professor Update test case

Select * from Course_Management_Admin.GRADE where grade_id=7003;

Update Course_Management_Admin.Grade set GRADE='A' where GRADE_ID=7003;
commit;
Select * from Course_Management_Admin.GRADE where grade_id=7003;


--Professor Select test case
select * from Course_Management_Admin.ADDRESS; 
select * from Course_Management_Admin.CITY;
select * from Course_Management_Admin.STATE;
select * from Course_Management_Admin.COUNTRY;
select * from Course_Management_Admin.PROGRAM;
select * from Course_Management_Admin.COURSE;
select * from Course_Management_Admin.CLASS;
select * from Course_Management_Admin.GRADE;
select * from Course_Management_Admin.PROFESSOR;
select * from Course_Management_Admin.STUDENT;
select * from Course_Management_Admin.PROFESSOR_SCHEDULE;

