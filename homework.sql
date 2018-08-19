create table Test_Master_EF2297
(
	ORDER_NO   NVARCHAR(12) NOT NULL PRIMARY KEY,
	ORDER_NAME NVARCHAR(50) NOT NULL,
	ORDER_SEX  NVARCHAR(1),
	ORDER_DATE DATE,
	ORDER_AMT  NUMERIC(9,3)
	INDEX SEX (ORDER_SEX)
)
------------------------------------------------------
create table Test_Detail_EF2297
(
	ORDER_NO   NVARCHAR(12) NOT NULL,
	ORDER_ITEM NVARCHAR(50) NOT NULL,
	ORDER_AMT  NUMERIC(9,3)
	PRIMARY KEY(ORDER_NO,ORDER_ITEM)
)
------------------------------------------------------
insert into Test_Master_EF2297(ORDER_NO,ORDER_NAME,ORDER_SEX,ORDER_DATE,ORDER_AMT)
values('20180001','陳小明','M','20180101',20000.50),
	  ('20180002','如花','F','20180301',50000.855),
	  ('20180003','大雄','M','20180801',40000)

insert into Test_Detail_EF2297(ORDER_NO,ORDER_ITEM,ORDER_AMT)
values('20180001','item 1',10000),
	  ('20180001','item 2',10000.5),
	  ('20180002','item 1',15000 ),
	  ('20180002','item 2',25000.005),
	  ('20180002','item 3',10000.85),
	  ('20180003','item 1',40000)
------------------------------------------------------
create table Test_Detail_EF2297_BK as select * from Test_Detail_EF2297
------------------------------------------------------
select ORDER_NO,ORDER_NAME,decode(ORDER_SEX,'M','Man','F','Woman'),to_char(ORDER_DATE, 'YYYYMMDD') from Test_Master_EF2297 where ORDER_DATE between to_date('2018-05-01', 'YYYYMMDD')  and to_date('2018-08-14', 'YYYYMMDD')

select ORDER_NO,round(ORDER_AMT,1) from Test_Master_EF2297

select ORDER_NO,trunc(ORDER_AMT,1) from Test_Master_EF2297

select ORDER_NO,ORDER_NAME,ORDER_DATE from Test_Master_EF2297 where ORDER_DATE between add_month(sysdate, 1)  and add_month(sysdate, -1) 

select ORDER_NO,case ORDER_SEX
when 'M' then ORDER_AMT * 2
else ORDER_AMT - 500
end
as ORDER_AMT
from Test_Master_EF2297

select * from Test_Master_EF2297 where ORDER_NO in (
select ORDER_NO 
from Test_Detail_EF2297 
group by ORDER_NO having COUNT(ORDER_NO) > 2)

select ORDER_NO,nvl(ORDER_NAME,'無名氏') from Test_Master_EF2297 
------------------------------------------------------
select m.ORDER_NO,m.ORDER_NAME,d.ORDER_ITEM,d.ORDER_AMT from Test_Master_EF2297 as m
inner join Test_Detail_EF2297 as d
on m.ORDER_NO = d.ORDER_NO

select m.ORDER_NO,m.ORDER_NAME,d.ORDER_ITEM,d.ORDER_AMT from Test_Master_EF2297 as m
left join Test_Detail_EF2297 as d
on m.ORDER_NO = d.ORDER_NO

select m.ORDER_NO,m.ORDER_NAME,d.ORDER_ITEM,d.ORDER_AMT from Test_Detail_EF2297 as d
right join Test_Master_EF2297 as m
on m.ORDER_NO = d.ORDER_NO
------------------------------------------------------
select * from Test_Master_EF2297 where Length(ORDER_NAME) > 3
select Lpad(substring(ORDER_NO,5,Length(ORDER_NO)-5+1),8,'z') from Test_Master_EF2297
select sysdate,add_months(sysdate,1) from dual
select trunc((sysdate),'month') as FirstDay from dual
select to_date(sysdate, 'YYYYMMDDHHMISS') from dual
------------------------------------------------------
select * from Test_Master_EF2297 where Length(ORDER_NAME) > 3
select Lpad(substring(ORDER_NO,5,Length(ORDER_NO)-5+1),8,'z') from Test_Master_EF2297
select sysdate,add_months(sysdate,1) from dual
select trunc((sysdate),'month') as FirstDay from dual
select to_date(sysdate, 'YYYYMMDDHHMISS') from dual 
------------------------------------------------------
Create Sequence seq_test_EF2297
    Increment By 3
    Start With 1
    Maxvalue 999
    Minvalue 1

------------------------------------------------------
Declare、Begin、Exception、End
declare 
	NextMonth date;
begin
	select add_months(sysdate,1) into NextMonth from dual
end
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------