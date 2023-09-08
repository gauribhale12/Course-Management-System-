Set Serveroutput on;
Create or Replace Package pkg_Insert_Data IS
Procedure Proc_Insert_Admin( Admin_Id number,Admin_Name varchar2);
Procedure Insert_Dept(dept_id in Number,dept_name in varchar2);
Procedure Insert_Program(Prog_id in Number,dept_id in Number, Program_Name in Varchar2);
Procedure Insert_Course(course_id in Number,prog_id in Number,course_name in varchar2, course_credit in VarChar2);
Procedure Insert_Country(Country_Id in Number, Country_Name in varchar2);
procedure Insert_State(s_id in Number, s_name in varchar2, c_id in number);
procedure insert_City(city_id in Number, city_name in varchar2, state_id in Number);
procedure Insert_Address(address_id in Number, address_line_1 in Varchar2, address_line_2 in varchar2, city_id in Number, zipcode in Number);
procedure Insert_Professor(prof_id in Number, dept_id in Number, prof_name in Varchar2, prof_email_id in Varchar2, prof_phone_no in Varchar2, address_id in Number, prof_dob in Date,course_id in Number,prof_gender in Varchar2);
procedure Insert_Professor_Schedule(schedule_id in Number, prof_id in Number, schedule_day in varchar2, schedule_start_time in Varchar2, schedule_duration in Number,status in varchar2);
procedure Insert_Student(student_id in Number, prog_id in Number, student_name in varchar2, student_email_id in varchar2, address_id in number,student_phone_no in Number, student_dob in Date, semester_intake in varchar2, student_gender in varchar2);
Procedure Class_Creation(c_id IN number,cur_id IN number, sch_id IN number, c_mode IN varchar2,c_total_seats IN number,c_available_seats in Number,c_location IN varchar2,sem IN varchar2);
Procedure Student_Class_Registration(reg_id in Number,stu_id in Number, cls_id in Number,r_date in Date,r_status in Varchar2);
Procedure Fee_Details_Added(f_id in Number);
Procedure Add_Grades(g_id in Number, grad in VarChar2);


End pkg_Insert_Data;
/
commit;