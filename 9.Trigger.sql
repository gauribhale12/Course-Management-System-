Set Serveroutput on;
-- Trigger for deleting the professor_schedule
CREATE OR REPLACE TRIGGER delete_Prof_schedule
After DELETE
ON Professor_Schedule
FOR EACH ROW 
Enable
DECLARE 
v_user varchar2(25);
BEGIN
Select user into v_user from dual;
DBMS_OUTPUT.PUT_LINE('Schedule has been deleted by '||v_user);
EXCEPTION 
WHEN Others Then
dbms_output.put_line(' Schedule has not been deleted');
END;
/

Create or Replace procedure trigger_test_Insert
Is
Begin
EXECUTE Immediate  q'!Insert into professor_schedule values(2056,1003,'Monday',to_char(to_date('27-SEP-2001 17:50:00','dd-mm-yyyy HH24:MI:SS'),'HH24:MI:SS AM'),4,'AVAILABLE')!';
Commit;
Exception
When others then
Dbms_output.put_line('Data not inserted');
End;
/

Exec Trigger_test_Insert();

Select * from professor_schedule;

Create or Replace procedure trigger_test_Delete
Is
Begin
EXECUTE Immediate  q'!Delete from Professor_Schedule where Schedule_id =2056 AND Status='AVAILABLE'!';
Commit;
Exception
When others then
Dbms_output.put_line('Data not deleted');
End;
/

EXEC trigger_test_delete();

Select * from professor_schedule;



