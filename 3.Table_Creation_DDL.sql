SET SERVEROUTPUT ON;

DECLARE
Counter NUMBER;
BEGIN
SELECT count(*) into Counter FROM user_tables where table_name = 'ADMIN';
IF(Counter > 0) THEN 
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('ADMIN TABLE ALREADY EXISTS IN DATABASE!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
ELSE
    EXECUTE IMMEDIATE 'Create Table Admin( Admin_Id Number(10) Primary Key,
                                           Admin_Name VarChar2(20) Not Null)';
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('ADMIN TABLE CREATED SUCCESSFULLY!!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    
END IF;
COMMIT;

-------------------------Department--------------------------------------------------
SELECT count(*) into Counter FROM user_tables where table_name = 'DEPARTMENT';
IF(Counter > 0) THEN 
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('DEPARTMENT TABLE ALREADY EXISTS IN DATABASE!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
ELSE
    EXECUTE IMMEDIATE 'Create Table Department(
                Dept_Id Number(10) Primary Key,
                Dept_Name Varchar2(50) Not Null
)';
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('DEPARTMENT TABLE CREATED SUCCESSFULLY!!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    
END IF;
COMMIT;


-------------------------Program--------------------------------------------------
SELECT count(*) into Counter FROM user_tables where table_name = 'PROGRAM';
IF(Counter > 0) THEN 
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('PROGRAM TABLE ALREADY EXISTS IN DATABASE!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
ELSE
    EXECUTE IMMEDIATE 'Create Table Program(
 Prog_Id Number(10) Primary Key,
 Dept_Id Number(10) Not Null,
 Program_Name Varchar2(50) Not Null,
 Constraint Prog_Dept_Id_FK Foreign Key(Dept_Id) References Department(Dept_Id) on delete cascade
 )';
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('PROGRAM TABLE CREATED SUCCESSFULLY!!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    
END IF;
COMMIT;

--------------------------------Course-------------------------------------------
SELECT count(*) into Counter FROM user_tables where table_name = 'COURSE';
IF(Counter > 0) THEN 
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('COURSE TABLE ALREADY EXISTS IN DATABASE!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
ELSE
    EXECUTE IMMEDIATE 'Create Table Course(
 Course_Id Number(10) Primary Key,
 Prog_Id Number(10) Not Null,
 Course_Name varchar2(50) Not Null,
 Course_Credit number(2) Not Null Check(Course_Credit IN (1,2,3,4)),
 Constraint Course_Prog_Id_FK Foreign Key(Prog_Id) References Program(Prog_Id) on delete cascade
 )';
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('COURSE TABLE CREATED SUCCESSFULLY!!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    
END IF;
COMMIT;

-----------------------------------COUNTRY------------------------------
SELECT count(*) into Counter FROM user_tables where table_name = 'COUNTRY';
IF(Counter > 0) THEN 
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('COUNTRY TABLE ALREADY EXISTS IN DATABASE!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
ELSE
    EXECUTE IMMEDIATE 'Create Table Country(Country_id Number(10),
                                            Country_name Varchar2(20) Not Null,
                                             PRIMARY KEY(Country_id)
                                            )';
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('COUNTRY TABLE CREATED SUCCESSFULLY!!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    
END IF;
COMMIT;

-----------------------------------State------------------------------
SELECT count(*) into Counter FROM user_tables where table_name = 'STATE';
IF(Counter > 0) THEN 
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('STATE TABLE ALREADY EXISTS IN DATABASE!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
ELSE
    EXECUTE IMMEDIATE 'Create Table State(State_id Number(10),
                                            State_name Varchar2(20) Not Null,
                                            Country_id Number(10),
                                            PRIMARY KEY(State_id),
                                            FOREIGN KEY(Country_id) REFERENCES Country(Country_id) ON DELETE CASCADE
                                            )';
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('STATE TABLE CREATED SUCCESSFULLY!!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    
END IF;
COMMIT;

-----------------------------------City------------------------------
SELECT count(*) into Counter FROM user_tables where table_name = 'CITY';
IF(Counter > 0) THEN 
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('CITY TABLE ALREADY EXISTS IN DATABASE!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
ELSE
    EXECUTE IMMEDIATE 'Create Table City(City_id Number(10),
                                            City_name Varchar2(20) Not Null,
                                            State_id Number(10),
                                            PRIMARY KEY(City_id),
                                            FOREIGN KEY(State_Id) REFERENCES State(State_id) ON DELETE CASCADE
                                            )';
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('CITY TABLE CREATED SUCCESSFULLY!!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    
END IF;
COMMIT;

----------------------------Address-------------------------------------------------------------
SELECT count(*) into Counter FROM user_tables where table_name = 'ADDRESS';
IF(Counter > 0) THEN 
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('ADDRESS TABLE ALREADY EXISTS IN DATABASE!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
ELSE
    EXECUTE IMMEDIATE 'Create Table Address(Address_id Number(10),
                                            Address_Line_1 Varchar2(100) Not Null,
                                            Address_Line_2 Varchar2(100),
                                            City_id Number(10)Not Null,
                                            ZipCode Number(10) Not Null,
                                            PRIMARY KEY(Address_id),
                                            FOREIGN KEY(City_ID) REFERENCES City(City_id) ON DELETE CASCADE
                                            )';
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('ADDRESS TABLE CREATED SUCCESSFULLY!!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    
END IF;
COMMIT;

---------------------------Student---------------------------------------------------------------------

SELECT count(*) into Counter FROM user_tables where table_name = 'STUDENT';
IF(Counter > 0) THEN 
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('STUDENT TABLE ALREADY EXISTS IN DATABASE!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
ELSE

    EXECUTE IMMEDIATE q'!Create Table Student(Student_id Number(10),
                                            Prog_id Number(10) Not Null,
                                            Student_name Varchar2(40) Not Null,
                                            Student_Email_id Varchar2(40) Not Null UNIQUE CHECK (REGEXP_LIKE (Student_Email_id, '^(\S+)\@(\S+)\.(\S+)$')),
                                            Address_id Number(10) NOT NULL,
                                            Student_Phone_no Varchar2(15) Not Null UNIQUE CHECK ((REGEXP_LIKE (Student_Phone_no, '^[0-9]{10}$')) AND (LENGTH(Student_Phone_no)=10)),
                                            Student_DOB Date Not Null ,
                                            Semester_Intake varchar2(10) Not Null CHECK(Semester_Intake IN ('SPRING', 'SUMMER', 'FALL')),
                                            Student_Gender Varchar2(20) Not Null check (Student_Gender IN ('MALE','FEMALE','OTHER')),
                                            PRIMARY KEY(Student_id),
                                            FOREIGN KEY(Prog_id) REFERENCES Program(Prog_id) ON DELETE CASCADE,
                                            FOREIGN KEY(Address_id) REFERENCES Address(Address_id)ON DELETE CASCADE
                                            )!';
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('STUDENT TABLE CREATED SUCCESSFULLY!!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    
END IF;
COMMIT;

-------------------------Professor----------------------------------------------------

SELECT count(*) into Counter FROM user_tables where table_name = 'PROFESSOR';
IF(Counter > 0) THEN 
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('PROFESSOR TABLE ALREADY EXISTS IN DATABASE!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
ELSE
    EXECUTE IMMEDIATE q'!Create Table Professor(Prof_id Number(10),
                                            Dept_id Number(10) Not Null,
                                            Prof_name Varchar2(20) Not Null,
                                            Prof_Email_id Varchar2(40) Not Null Unique  CHECK ( REGEXP_LIKE ( Prof_Email_id, '^(\S+)\@(\S+)\.(\S+)$' )),
                                            Prof_Phone_no Varchar2(15) Not Null UNIQUE CHECK ((REGEXP_LIKE (Prof_Phone_no, '^[0-9]{10}$')) AND (LENGTH(Prof_Phone_no)=10)),
                                            Address_id Number(10) Not Null,
                                            Prof_DOB Date Not Null,
                                            Course_id Number(10) Not Null,
                                            Prof_Gender Varchar2(7) Not Null Check (Prof_Gender IN ('MALE','FEMALE','OTHER')),
                                            PRIMARY KEY(Prof_id),
                                            FOREIGN KEY(Dept_id) REFERENCES Department(Dept_id) ON DELETE CASCADE,
                                            FOREIGN KEY(Course_id) REFERENCES Course(Course_id) ON DELETE CASCADE,
                                            FOREIGN KEY(Address_id) REFERENCES Address(Address_id) ON DELETE CASCADE
                                            )!';
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('PROFESSOR TABLE CREATED SUCCESSFULLY!!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    
END IF;
COMMIT;


--------------------------------Professor Schedule-------------------------------------------
SELECT count(*) into Counter FROM user_tables where table_name = 'PROFESSOR_SCHEDULE';
IF(Counter > 0) THEN 
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('PROFESSOR SCHEDULE TABLE ALREADY EXISTS IN DATABASE!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
ELSE
    EXECUTE IMMEDIATE q'!Create Table Professor_Schedule(Schedule_id Number(10) PRIMARY KEY,
                                            Prof_id Number(10),
                                            Schedule_Day Varchar2(20) Not Null,
                                            Schedule_Start_Time Varchar2(50) Not Null,
                                            Schedule_Duration Number(3,2) Not Null,
                                            Status varchar2(20) Not Null check (Status IN('AVAILABLE','BOOKED')),
                                            FOREIGN KEY(Prof_id) REFERENCES PROFESSOR(Prof_id) ON DELETE CASCADE
                                            )!';
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('PROFESSOR SCHEDULE TABLE CREATED SUCCESSFULLY!!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    
END IF;
COMMIT;

--------------------------------Class-------------------------------------------
SELECT count(*) into Counter FROM user_tables where table_name = 'CLASS';
IF(Counter > 0) THEN 
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('CLASS TABLE ALREADY EXISTS IN DATABASE!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
ELSE
    EXECUTE IMMEDIATE q'! Create Table Class(
                         Class_Id Number(10) Primary Key,
                         Course_Id Number(10) Not Null,
                         Schedule_Id Number(10) Not Null,
                         Class_Mode Varchar2(10) NOT NULL CHECK( Class_Mode IN('ONLINE','OFFLINE')) ,
                         Class_Total_Seats Number(10) NOT NULL,
                         Class_Available_Seats Number(10),
                         Class_Location Varchar2(60),
                         Semester varchar2(10) Not Null CHECK(SEMESTER IN ('SPRING', 'SUMMER', 'FALL')),
                         Constraint Class_Course_Id_FK Foreign Key(Course_Id) References Course(Course_Id) on delete cascade,
                         Constraint Class_Schedule_Id_FK Foreign Key(Schedule_Id) References Professor_Schedule(Schedule_Id) on delete cascade
                         )!';
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('CLASS TABLE CREATED SUCCESSFULLY!!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    
END IF;
COMMIT;


--------------------------------Registration----------------------------------------------
SELECT count(*) into Counter FROM user_tables where table_name = 'REGISTRATION';
IF(Counter > 0) THEN 
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('REGISTRATION TABLE ALREADY EXISTS IN DATABASE!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
ELSE
    EXECUTE IMMEDIATE q'!Create Table Registration (
                    Registration_Id Number(10) Primary Key,
                    Student_Id Number(10) Not Null,
                    Class_Id Number(10) Not Null,
                    Reg_date Date Not Null,
                    Reg_Status Varchar2(20) Check( Reg_Status IN ('REGISTERED', 'DROPPED')),
                    Constraint Student_Id_FK Foreign Key(Student_Id) References Student(Student_Id) On Delete Cascade,
                    Constraint Class_Id_FK Foreign Key(Class_Id) References Class(Class_Id) on delete cascade 
                           )!';
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('REGISTRATION TABLE CREATED SUCCESSFULLY!!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    
END IF;
--------------------------------Fee-------------------------------------------
SELECT count(*) into Counter FROM user_tables where table_name = 'FEE';
IF(Counter > 0) THEN 
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('FEE TABLE ALREADY EXISTS IN DATABASE!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
ELSE
    EXECUTE IMMEDIATE q'!Create table Fee(
                       Fee_Id Number(10) Primary Key,
                       Registration_Id Number(10) Not Null,
                       Amount Number(10,5)Not Null,
                       Fee_Submitted_Date Date,
                       Fee_Status varchar2(10) Not Null Check(Fee_Status IN('PAID','UNPAID')),
                       Fee_last_date Date Not Null,
                       Constraint Registration_Id_FK Foreign Key(Registration_Id) References Registration(Registration_Id) on delete cascade
                              )!';
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('FEE TABLE CREATED SUCCESSFULLY!!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    
END IF;
COMMIT;

--------------------------------Grade-------------------------------------------
SELECT count(*) into Counter FROM user_tables where table_name = 'GRADE';
IF(Counter > 0) THEN 
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('GRADE TABLE ALREADY EXISTS IN DATABASE!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
ELSE
    EXECUTE IMMEDIATE q'!Create Table Grade(
                       Grade_Id Number(10) Primary Key,
                       Registration_id Number(10) Not Null,
                       Grade Varchar2(5) Not Null check (Grade IN ('A+','B+','A','B','C+','C','F','N/A')),
                       Constraint Grade_Registration_Id_FK Foreign Key(Registration_id) References Registration(Registration_id) on delete cascade
                      )!';
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('GRADE TABLE CREATED SUCCESSFULLY!!!');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');
    
END IF;
COMMIT;



END;
/
