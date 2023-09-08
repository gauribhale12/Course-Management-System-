
Create or Replace Procedure CheckSequence(Seq_name in varchar2, minval in Number, maxval in Number)IS
Seq_Counter number;

BEGIN
Execute Immediate 'Create Sequence '||Seq_name||' increment by 1 start with '||minval||' MINVALUE '||minval||'MAXVALUE '||maxval||'cache 20';
commit;
dbms_output.put_line(Seq_Name||' created successfully');

Exception
When Others then
Execute Immediate 'Drop Sequence '|| Seq_name;
dbms_output.put_line(Seq_Name||' dropped successfully');
CheckSequence(Seq_name,minval,maxval);
END;
/
EXEC CheckSequence('Dept_SEQ',100,199);
EXEC CheckSequence('Prog_SEQ',200,299);
EXEC CheckSequence('Course_SEQ',300,399);
EXEC CheckSequence('Country_SEQ',700,799);
EXEC CheckSequence('State_SEQ',600,699);
EXEC CheckSequence('City_SEQ',9000,9999);
EXEC CheckSequence('Addr_SEQ',8000,8999);
EXEC CheckSequence('Prof_SEQ',1000,1999);
EXEC CheckSequence('Prof_SCH_SEQ',2000,2999);
EXEC CheckSequence('Stu_SEQ',4000,4999);
EXEC CheckSequence('Class_SEQ',3000,3999);
EXEC CheckSequence('Reg_SEQ',5000,5999);
EXEC CheckSequence('Fee_SEQ',6000,6999);
EXEC CheckSequence('Grade_SEQ',7000,7999);


  
    
    
    