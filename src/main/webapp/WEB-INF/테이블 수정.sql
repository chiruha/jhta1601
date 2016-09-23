alter table gx_register rename column ct_code to ct_name;
alter table gx_register modify (ct_name varchar2(20));
alter table gx_register rename column mom09 to mon09;