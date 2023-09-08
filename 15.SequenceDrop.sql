Set Serveroutput on;
Create or Replace Procedure DropSequence(Seq_name in varchar2)IS
Seq_Counter number;

BEGIN
Execute Immediate 'Drop Sequence '|| Seq_name;
dbms_output.put_line(Seq_Name||' dropped successfully');
commit;
Exception
When Others then
dbms_output.put_line(Seq_Name||' does not exist');

END;
/
EXEC DropSequence('Dept_SEQ');
EXEC DropSequence('Prog_SEQ');
EXEC DropSequence('Course_SEQ');
EXEC DropSequence('Country_SEQ');
EXEC DropSequence('State_SEQ');
EXEC DropSequence('City_SEQ');
EXEC DropSequence('Addr_SEQ');
EXEC DropSequence('Prof_SEQ');
EXEC DropSequence('Prof_SCH_SEQ');
EXEC DropSequence('Stu_SEQ');
EXEC DropSequence('Class_SEQ');
EXEC DropSequence('Reg_SEQ');
EXEC DropSequence('Fee_SEQ');
EXEC DropSequence('Grade_SEQ');

commit;
