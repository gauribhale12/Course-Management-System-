Set Serveroutput on;
-- Packages for inserting procedure

--Package Body
Create or Replace Package Body pkg_Insert_Data IS

-- Admin Insertion Procedure
--create or replace 
procedure  Proc_Insert_Admin( Admin_Id number,Admin_Name varchar2)
AS
begin

insert into Admin(Admin_Id,Admin_Name)values (Admin_Id,Admin_Name);
commit;
    
exception
when dup_val_on_index 
then 
dbms_output.put_line('Duplicate row');
when others then
dbms_output.put_line('Error Found. Check your input');
end;



--/

-- Department Insertion Procedure

--Create or Replace 
Procedure Insert_Dept(dept_id in Number,dept_name in varchar2) IS
Begin
INSERT into DEPARTMENT(Dept_Id,Dept_name) Values(dept_id,dept_name);
commit;
dbms_output.put_line('Department added!');
exception
when dup_val_on_index then
dbms_output.put_line('Duplicate Value ');
when others then
dbms_output.put_line('Error Found. Check your input');
end;
--/

-- Program Insertion Procedure

--Create or Replace
Procedure Insert_Program(Prog_id in Number,dept_id in Number, Program_Name in Varchar2) IS
Begin
INSERT into Program(Prog_Id,Dept_Id,Program_name) Values(Prog_id,dept_id,Program_name);
commit;
dbms_output.put_line('Program added!');
exception
when dup_val_on_index then
dbms_output.put_line('Duplicate Value ');
when others then
dbms_output.put_line('Error Found. Check your input');
end;
--/

-- Course Insertion Procedure


--Create or Replace 
Procedure Insert_Course(course_id in Number,prog_id in Number,course_name in varchar2, course_credit in VarChar2) IS
Begin
INSERT into COURSE Values(course_id ,prog_id,course_name , course_credit);
commit;
dbms_output.put_line('Course added!');
exception
when dup_val_on_index then
dbms_output.put_line('Duplicate Value ');
when others then
dbms_output.put_line('Error Found. Check your input');
end;
--/

-- Country Insertion Procedure

--Create or Replace 
Procedure Insert_Country(Country_Id in Number, Country_Name in varchar2) IS
Begin
INSERT into COUNTRY Values(country_id ,country_name);
commit;
dbms_output.put_line('Country added!');
exception
when dup_val_on_index then
dbms_output.put_line('Duplicate Value ');
when others then
dbms_output.put_line('Error Found. Check your input');
end;
--/

-- State Insertion Procedure
--Create or Replace 
procedure Insert_State(s_id in Number, s_name in varchar2, c_id in number) is
Country_Id_Counter Country.Country_id%type;

begin

insert into State(State_Id, State_Name, Country_Id) values (s_id, s_name, c_id);
commit;

EXCEPTION
when dup_val_on_index then
dbms_output.put_line('Duplicate row');
when Others then
dbms_output.put_line('Please check your input. Error found :');
end Insert_State;
--/

-- City Procedure
--Create or Replace 
procedure insert_City(city_id in Number, city_name in varchar2, state_id in Number) is
State_Id_Counter State.State_id%type;

begin

insert into City(City_Id, City_Name, State_Id) values (city_id, city_name, state_id);
commit;

exception

when dup_val_on_index then
dbms_output.put_line('Duplicate row');
when Others then
dbms_output.put_line('Please check your input. Error found :');
end insert_City;
--/

--Address Procedure

--Create or Replace
procedure Insert_Address(address_id in Number, address_line_1 in Varchar2, address_line_2 in varchar2, city_id in Number, zipcode in Number) is
City_Id_Counter City.City_id%type;

begin

insert into Address(Address_Id, Address_Line_1, Address_Line_2, City_Id, Zipcode) values (address_id, address_line_1, address_line_2, city_id, zipcode);
commit;

exception

when dup_val_on_index then
dbms_output.put_line('Duplicate row');
when Others then
dbms_output.put_line('Please check your input. Error found :');
end Insert_Address;
--/

-- Professor Procedure

--Create or Replace 
procedure Insert_Professor(prof_id in Number, dept_id in Number, prof_name in Varchar2, prof_email_id in Varchar2, prof_phone_no in Varchar2, address_id in Number, prof_dob in Date,course_id in Number,prof_gender in Varchar2) as

begin

insert into Professor(Prof_Id, Dept_Id, Prof_Name, Prof_Email_Id, Prof_Phone_no, Address_Id, Prof_DOB,Course_id,Prof_Gender) values (prof_id, dept_id, prof_name, prof_email_id, prof_phone_no, address_id, prof_dob,course_id,prof_gender);
commit;
exception
when dup_val_on_index then
dbms_output.put_line('Duplicate row');
when Others then
dbms_output.put_line('Please check your input. Error found :');
end Insert_Professor;
--/


-- Professor_Schedule Procedure

--CREATE or REPLACE 
procedure Insert_Professor_Schedule(schedule_id in Number, prof_id in Number, schedule_day in varchar2, schedule_start_time in Varchar2, schedule_duration in Number,status in varchar2) as

Status_Wrong Exception;

begin

IF(TRIM(UPPER(status))<> 'AVAILABLE') Then
Raise Status_Wrong;
ELSE
insert into Professor_Schedule(Schedule_Id, Prof_Id, Schedule_Day, Schedule_Start_Time, Schedule_Duration,Status) values (schedule_id, prof_id, schedule_day, schedule_start_time, schedule_duration,status);
commit;
END IF;
exception
When Status_Wrong then
dbms_output.put_line('Status should be AVAILABLE while creating a schedule');
when dup_val_on_index then
dbms_output.put_line('Duplicate row');
when Others then
dbms_output.put_line('Please check your input. Error found :' );

end Insert_Professor_Schedule;
--/


-- Student Procedure

--CREATE Or REPLACE
procedure Insert_Student(student_id in Number, prog_id in Number, student_name in varchar2, student_email_id in varchar2, address_id in number,student_phone_no in Number, student_dob in Date, semester_intake in varchar2, student_gender in varchar2) as

begin

insert into Student(Student_Id, Prog_id, Student_Name, Student_Email_Id, Address_id,Student_Phone_no, Student_DOB,Semester_Intake,Student_Gender) values (student_id, prog_id, student_name, student_email_id, address_id,student_phone_no, student_dob,semester_intake,student_gender);
dbms_output.put_line('Student record added');
commit;

exception

when dup_val_on_index then
dbms_output.put_line('Duplicate row');
when Others then
dbms_output.put_line('Please check your input. Error found :');
end Insert_Student;
--/


--Class_Creation Procedure
--Create or Replace 
Procedure Class_Creation(c_id IN number,cur_id IN number, sch_id IN number, c_mode IN varchar2,c_total_seats IN number,c_available_seats in Number,c_location IN varchar2,sem IN varchar2)
IS
Schedule_Counter Professor_Schedule.Schedule_id%type;
Schedule_Status1 Professor_Schedule.Status%type;
Prof_ID_Counter Professor_Schedule.Prof_id%type;
Professor_Course_ID Professor.Course_id%type;
Schedule_Taken Exception;
Not_Professor_Course Exception;
Class_Present Exception;
Total_Available_Donot_Match Exception;
NO_LOCATION Exception;
ONLINE_LOCATION EXCEPTION;
Schedule_ID_Invalid EXCEPTION;

Begin

Select Count(Schedule_id) into Schedule_Counter from Professor_Schedule where Schedule_id = sch_id;
Select Status into Schedule_Status1 from Professor_Schedule where Schedule_id = sch_id;

Select Prof_id into Prof_ID_Counter from Professor_Schedule where Schedule_id = sch_id;
IF(Schedule_Counter <> 0) Then
    IF(TRIM(UPPER(Schedule_Status1))='BOOKED') Then
        Raise Schedule_Taken;
    Else
        Select Course_id into Professor_Course_ID from Professor where Prof_id = Prof_ID_Counter;
        IF(Professor_Course_ID <> cur_id) Then
            Raise Not_Professor_Course;
        Else
            IF(c_total_seats<>c_available_seats) Then
                Raise Total_Available_Donot_Match;
            ELSE
                IF(TRIM(UPPER(c_mode))='OFFLINE') THEN
                    IF(c_location IS NULL) THEN
                         RAISE NO_LOCATION;
                    ELSE 
                        Insert into Class (Class_id ,Course_id , Schedule_id , Class_mode ,Class_total_seats ,Class_Available_Seats,class_location ,Semester) Values(c_id ,cur_id , sch_id , c_mode ,c_total_seats ,c_available_seats,c_location ,sem);
                        dbms_output.put_line('Class Added');
                        Update Professor_Schedule SET Status = 'BOOKED' where Schedule_id = sch_id;
                        COMMIT;
                   END IF;
                ELSIF(TRIM(UPPER(c_mode))='ONLINE') THEN
                        IF(c_location IS NULL) THEN
                            Insert into Class (Class_id ,Course_id , Schedule_id , Class_mode ,Class_total_seats ,Class_Available_Seats,class_location ,Semester) Values(c_id ,cur_id , sch_id , c_mode ,c_total_seats ,c_available_seats,c_location ,sem);
                            dbms_output.put_line('Class Added');
                            Update Professor_Schedule SET Status = 'BOOKED' where Schedule_id = sch_id;
                            COMMIT;
                        ELSE
                            RAISE ONLINE_LOCATION;
                        END IF;
                END IF;
                
                
            END IF;
        END IF;
    End IF;
ELSE
    Raise Schedule_ID_Invalid;
End IF;
Exception
when Schedule_ID_Invalid then
dbms_output.put_line('Referred schedule id not present !!!!');
when ONLINE_LOCATION then
dbms_output.put_line('Online class doesnot required a location !!!!');
when NO_LOCATION then
dbms_output.put_line('Offline class required a location !!!!');
when Total_Available_Donot_Match then
dbms_output.put_line('Initially class total seats and class available seats should be equal!!!!');
when Schedule_Taken then
dbms_output.put_line('Schedule is already taken!!!!');
when Not_Professor_Course then
dbms_output.put_line('Professor does not teach this course!!!!');
when dup_val_on_index then
dbms_output.put_line('Duplicate row');
when Others then
dbms_output.put_line('Please check your input. Error found :');
End Class_Creation;
--/


-------------------Class Registration Procedure------------------------------------
 

--Create or Replace 
Procedure Student_Class_Registration(reg_id in Number,stu_id in Number, cls_id in Number,r_date in Date,r_status in Varchar2) IS
Student_Counter Student.Student_id%type;
Course_Counter Course.Course_id%type;
Credit_Counter Course.Course_Credit%type;
Registration_Counter Registration.Registration_id%type;
Class_Seats_Left Class.Class_Total_Seats%type;
Fee_Date Fee.Fee_last_date%type;
Class_Full Exception;
Student_Already_Registered Exception;
R_Status_NotValid Exception;


Begin

Select Course_id into Course_Counter from Class where Class_id = cls_id;
Select Course_credit into Credit_Counter from Course where Course_id = Course_Counter;

Fee_Date := ADD_MONTHS(r_date,2);

SELECT Class_Available_Seats into Class_Seats_Left FROM Class where Class_id = cls_id;
SELECT Count(Registration_id) into Registration_Counter From REGISTRATION Where Student_id = stu_id AND Class_id = cls_id;
IF(Registration_Counter =0) THEN
    IF (TRIM(UPPER(r_status))='REGISTERED')  THEN
        -- IF(Student_Counter<>0 AND Class_Counter<>0) THEN
        IF(Class_Seats_Left<>0) THEN
            IF(Credit_Counter=1) Then
                INSERT INTO Registration (Registration_id,Student_id,Class_id,Reg_Date,Reg_Status) Values (reg_id,stu_id, cls_id ,r_date,r_status);
                dbms_output.put_line('Student registered for class');
                UPDATE Class SET Class_Available_Seats = (Class_Available_Seats - 1) where Class_id = cls_id;
                Insert into Fee(Fee_id,Registration_id,Amount,Fee_submitted_date,Fee_status,Fee_last_date) Values(fee_seq.NEXTVAL,reg_id, 1500,NULL,'UNPAID',Fee_Date);
                Commit;
            ELSIF(Credit_Counter=2) Then
                INSERT INTO Registration (Registration_id,Student_id,Class_id,Reg_Date,Reg_Status) Values (reg_id,stu_id, cls_id ,r_date,r_status);
                dbms_output.put_line('Student registered for class');
                UPDATE Class SET Class_Available_Seats = (Class_Available_Seats - 1) where Class_id = cls_id;
                Insert into Fee(Fee_id,Registration_id,Amount,Fee_submitted_date,Fee_status,Fee_last_date) Values(fee_seq.NEXTVAL,reg_id, 1500,NULL,'UNPAID',Fee_Date);
                Insert into Grade (Grade_id,Registration_id,Grade)Values(GRADE_SEQ.NEXTVAL,reg_id,'N/A');
                Commit;
            ELSIF(Credit_Counter=3) Then
                INSERT INTO Registration (Registration_id,Student_id,Class_id,Reg_Date,Reg_Status) Values (reg_id,stu_id, cls_id ,r_date,r_status);
                dbms_output.put_line('Student registered for class');
                UPDATE Class SET Class_Available_Seats = (Class_Available_Seats - 1) where Class_id = cls_id;
                Insert into Fee(Fee_id,Registration_id,Amount,Fee_submitted_date,Fee_status,Fee_last_date) Values(fee_seq.NEXTVAL,reg_id, 1500,NULL,'UNPAID',Fee_Date);
                Insert into Grade (Grade_id,Registration_id,Grade)Values(GRADE_SEQ.NEXTVAL,reg_id,'N/A');
                Commit;
            ELSIF(Credit_Counter=4) Then
                INSERT INTO Registration (Registration_id,Student_id,Class_id,Reg_Date,Reg_Status) Values (reg_id,stu_id,cls_id,r_date,r_status);
                dbms_output.put_line('Student registered for class');
                UPDATE Class SET Class_Available_Seats = (Class_Available_Seats - 1) where Class_id = cls_id;
                Insert into Fee(Fee_id,Registration_id,Amount,Fee_submitted_date,Fee_status,Fee_last_date) Values(fee_seq.NEXTVAL,reg_id, 1500,NULL,'UNPAID',Fee_Date);
                Insert into Grade (Grade_id,Registration_id,Grade)Values(GRADE_SEQ.NEXTVAL,reg_id,'N/A');
                Commit;
            END IF;
        ELSE
            Raise Class_Full;
        END IF;
        
        -- ELSE
        -- Raise Wrong_Input;
        -- END IF;
    ELSE
        Raise R_Status_NotValid;
    END IF;
ELSE 
    RAISE Student_Already_Registered;
END IF;
Exception
when R_Status_NotValid then
dbms_output.put_line('Registeration Status is registered when a student registers for a class!!!!');
when Student_Already_Registered then
dbms_output.put_line('Student is already registered for the class!!!!');
--when Wrong_Input then
--dbms_output.put_line('Wrong values added. Please check the Class Id or Student Id !!!!');
when Class_Full then
dbms_output.put_line('Class is full!!!!');
when dup_val_on_index
then
dbms_output.put_line('Duplicate row');
when Others then
dbms_output.put_line('Please check your input. Error found :');
End Student_Class_Registration;
--/


-- Fee Procedure

--Create or Replace 
Procedure Fee_Details_Added(f_id in Number) IS
Fee_Status_Counter Fee.Fee_status%type;

Fee_Already_Paid Exception;
Begin

Select FEE_STATUS into Fee_Status_Counter from FEE where Fee_id = f_id;
IF(TRIM(UPPER(Fee_Status_Counter)) = 'UNPAID') Then
UPDATE Fee SET Fee_status= 'PAID',FEE_SUBMITTED_DATE = sysdate where Fee_id = f_id;
dbms_output.put_line('Fee Paid');
Commit;
Else
Raise Fee_Already_Paid;
END IF;

Exception
when Fee_Already_Paid then
dbms_output.put_line('Fee already paid !!!!');
when dup_val_on_index then
dbms_output.put_line('Duplicate row');
when Others then
dbms_output.put_line('Please check your input. Error found!!!!');
END Fee_Details_Added;
--/


-- Grade Procedure

--Create or Replace
Procedure Add_Grades(g_id in Number, grad in VarChar2) IS
Grade_Counter Grade.Grade%type;
Grade_Already_Assigned Exception;
Begin
SELECT Grade into Grade_Counter FROM GRADE WHERE Grade_id =g_id;IF(TRIM(UPPER(Grade_Counter))='N/A')Then
UPDATE GRADE SET Grade= TRIM(UPPER(grad)) where Grade_id = g_id;
COMMIT;
ELSE
Raise Grade_Already_Assigned;
END IF;
Exception
when Grade_Already_Assigned then
dbms_output.put_line('Student grade already assigned for the class!!!!');
when dup_val_on_index then
dbms_output.put_line('Duplicate row');
when Others then
dbms_output.put_line('Please check your input. Error found!!!!');

End Add_Grades;
--/


End pkg_Insert_Data;