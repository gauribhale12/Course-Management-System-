Set serveroutput on;
-- Student select test case

Select * from Course_Management_Admin.ADDRESS;
Select * from Course_Management_Admin.CITY;
Select * from Course_Management_Admin.STATE;
Select * from Course_Management_Admin.COUNTRY;
Select * from Course_Management_Admin.PROGRAM;
Select * from Course_Management_Admin.COURSE;
Select * from Course_Management_Admin.CLASS;
Select * from Course_Management_Admin.REGISTRATION;
Select * from Course_Management_Admin.GRADE;
Select * from Course_Management_Admin.STUDENT;
Select * from Course_Management_Admin.FEE;

--Student Update testcase
Select * from Course_Management_Admin.REGISTRATION order by Registration_id;
Update Course_Management_Admin.REGISTRATION set REG_STATUS='DROPPED' Where REGISTRATION_ID =5000;
commit;
Select * from Course_Management_Admin.REGISTRATION order by Registration_id;
