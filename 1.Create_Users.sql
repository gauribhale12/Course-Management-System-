
Set serveroutput on;
Create or Replace Procedure Create_user
As
BEGIN
-- Creating Course Management Admin
Execute Immediate 'Create USER Course_Management_Admin 
                    IDENTIFIED BY Admin123456789';
Execute Immediate 'GRANT EXECUTE ANY TYPE, EXECUTE ANY PROCEDURE, ALTER ANY PROCEDURE, CREATE ANY TABLE, UNLIMITED TABLESPACE, DROP ANY TRIGGER, CREATE ANY PROCEDURE, ALTER ANY INDEX, CREATE ANY INDEX, CREATE TABLE, CREATE SESSION, DROP ANY TYPE, CREATE ANY TRIGGER, CREATE SEQUENCE, DROP ANY INDEX, SELECT ANY TABLE, DROP ANY TABLE, CREATE ANY TYPE, ALTER ANY TRIGGER, ALTER ANY SEQUENCE, CREATE ANY SEQUENCE, UPDATE ANY TABLE, CREATE TRIGGER, DROP ANY PROCEDURE, DROP ANY SEQUENCE, CREATE ANY VIEW, DELETE ANY TABLE, INSERT ANY TABLE, ALTER ANY TABLE, READ ANY TABLE, DEBUG CONNECT SESSION, MERGE ANY VIEW, ALTER ANY TYPE, CREATE PROCEDURE, SELECT ANY SEQUENCE, DROP ANY VIEW, CREATE VIEW to Course_Management_Admin';                    
-- Creating Professor User
Execute Immediate 'Create USER Professor1 
                    IDENTIFIED BY Admin12345678';
Execute Immediate 'GRANT create session TO Professor1';

-- Creating Student User
Execute Immediate 'CREATE USER Student1
IDENTIFIED BY Admin1234567';

Execute Immediate 'GRANT create session TO Student1';
DBMS_OUTPUT.PUT_LINE('Users created successfully');
commit;
Exception
When others then
DBMS_OUTPUT.PUT_LINE('Exception raised user not created');
end;
/
EXEC Create_user();

