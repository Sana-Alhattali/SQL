-- sequence

create sequence countBy1
start with 1
increment by 1;

create sequence countBy
start with 1
increment by 1
maxvalue 10;

select * from sys.sequences where name='countby1';

select * from sys.sequences where name='countby';

create sequence DecSeq 
as decimal(3,0)
start with 125
increment by 25
minvalue 100
maxvalue 200
cycle
cache 3;
select next value for DecSeq;
select * from Customer where FirstName = 'Thomas';

