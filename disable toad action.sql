create or replace procedure set_action as
begin
 dbms_application_info.set_action('LOADING_DATA');
end ;

<<<<<<< HEAD
create or replace trigger restrict_login
after logon on database
declare
  flag varchar2(100) := ' ';
  v_username := '';
begin
=======
create or replace trigger restrict_login 
after logon on database 
declare 
 flag varchar2(100) := ' '; 
 v_username := '';
begin 
>>>>>>> origin/master

SELECT SYS_CONTEXT ('USERENV', 'SESSION_USER')
into   v_username
FROM   DUAL;

SELECT NVL(SYS_CONTEXT ('USERENV', 'ACTION'),'')
into   flag
FROM   DUAL;

if upper(v_username) = 'HOPOST' AND flag = 'LOADING_DATA' then
  raise_application_error(-20000, 'You are not Authorised to Access from TOAD/SQLPLUS');
end if;

end;
