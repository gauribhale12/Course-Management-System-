Set serveroutput on;
create or replace procedure remove_user
as
Begin
Execute Immediate 'DROP User Course_Management_Admin cascade';
Execute Immediate 'DROP User Student1 cascade';
Execute Immediate 'DROP User Professor1 cascade';

DBMS_OUTPUT.PUT_LINE('USERS REMOVED');
Exception
When Others then
DBMS_OUTPUT.PUT_LINE('Exception handled ---- user does not exist');
end;
/

EXEC remove_user();

