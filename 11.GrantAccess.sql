Set serveroutput on;
Create or Replace Procedure Createprofileanduser
As
BEGIN
--Granting priveledges to professor

Execute Immediate 'grant select on DEPARTMENT to Professor1';
Execute Immediate 'grant select on ADDRESS to Professor1';
Execute Immediate 'grant select on CITY to Professor1';
Execute Immediate 'grant select on STATE to Professor1';
Execute Immediate 'grant select on COUNTRY to Professor1';
Execute Immediate 'grant select on PROGRAM to Professor1';
Execute Immediate 'grant select on COURSE to Professor1';
Execute Immediate 'grant select on CLASS to Professor1';
Execute Immediate 'grant select on REGISTRATION to Professor1';
Execute Immediate 'grant select on GRADE to Professor1';
Execute Immediate 'grant select on PROFESSOR to Professor1';
Execute Immediate 'grant select on STUDENT to Professor1';
Execute Immediate 'grant select on PROFESSOR_SCHEDULE to Professor1';
Execute Immediate 'grant update,insert,delete on PROFESSOR_SCHEDULE to Professor1';
Execute Immediate 'grant update on PROFESSOR to Professor1';
Execute Immediate 'grant update on GRADE to Professor1';
Execute Immediate 'grant update on ADDRESS to Professor1';


--- Granting priveledges to student

Execute Immediate 'grant select on ADDRESS to Student1';
Execute Immediate 'grant select on CITY to Student1';
Execute Immediate 'grant select on STATE to Student1';
Execute Immediate 'grant select on COUNTRY to Student1';
Execute Immediate 'grant select on PROGRAM to Student1';
Execute Immediate 'grant select on COURSE to Student1';
Execute Immediate 'grant select on CLASS to Student1';
Execute Immediate 'grant select on REGISTRATION to Student1';
Execute Immediate 'grant select on GRADE to Student1';
Execute Immediate 'grant select on STUDENT to Student1';
Execute Immediate 'grant select on FEE to Student1';
Execute Immediate 'grant update on STUDENT to Student1';
Execute Immediate 'grant update on REGISTRATION to Student1';
Execute Immediate 'grant update on ADDRESS to Professor1';

DBMS_OUTPUT.PUT_LINE('Executed successfully');
commit;
Exception
When others then
DBMS_OUTPUT.PUT_LINE('Exception raised user not created');
end;
/

EXEC Createprofileanduser();

