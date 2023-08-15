/*create table Student(
Studentid int not null primary key,
Name [NVARCHAR](50) not null,
Location [NVARCHAR](50) not null,
Email [NVARCHAR](50) not null);*/

EXEC sp_help 'STD';

--insert into Student values(1,'Sana', 'Muscat', 'sana12@gmail.com');
--insert into Student values(2,'Sara', 'Nizwa', 'sara@gmail.com');

select * from STD;
alter database makeenDB modify name = DB_Makeen;

Exec sp_rename student, STD;
alter table STD add phone numeric(8);
alter table STD alter column phone numeric(15);
alter table STD drop column phone;
alter table STD add phone numeric(8);
alter table STD alter column phone numeric NOT NULL;
alter table STD add age int;
alter table STD add constraint s_age check (age>20);


create table Course(
C_id char(8) constraint course_id primary key,
C_Name NVARCHAR(20));

insert into Course values(12,'IT');
insert into Course values(11,'MATH');
insert into Course values(13,NULL);

select * from Course;

alter table STD add C_id char(8);

alter table STD add constraint STD_Course_fk  FOREIGN KEY (C_id) REFERENCES Course(C_id);

--CONSTRAINT STD_Course_fk  FOREIGN KEY (C_id) REFERENCES Course(C_id) on delete cascade;


Select TABLE_NAME, 
       CONSTRAINT_TYPE, CONSTRAINT_NAME
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where TABLE_NAME='STD';

ALTER TABLE STD DROP CONSTRAINT s_age;
EXEC sp_help 'STD';
select SYSDATETIME() as today;
select CONVERT (TIME, SYSDATETIME());
 
create table stud1 (
s1_id int not null,
s1_name nvarchar(50)
);
insert into stud1 values(1,'mohammed');
insert into stud1 values(2,'salim');

create table stud2 (
s2_id int not null,
s2_name_s1 nvarchar(50)
);

insert into stud2 (s2_id, s2_name_s1) select s1_id , s1_name from stud1; 
select * from stud1;
select * from stud2;

update stud1 set s1_name = 'ali'  where s1_id =1;

create table product (
id int not null,
name nvarchar(50),
countity int not null,
price numeric not null
);
insert into product values(1,'water', 2, 4.5);
insert into product values(1,'water', 2,3);

insert into product values(2,'tea', 5, 2.000);
select countity*price as totalprice from product where name='water';

update product set countity =(select countity from product where id = 1) where id =2;

begin Transaction;
update product set price= 1 where id=1;
commit;
update product set price = 5 where id =1;
rollback;

delete from product where id=1;
select distinct name from product;

select * from product;

select sum(countity) as total from product;








