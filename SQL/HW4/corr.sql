#Find the corr:
#My lag function was not working so I did this instead
drop table if exists corr;
create table corr select interest as inter2, date from lds;

delete from corr
order by date desc limit 1;

insert into corr
values(0, '2014-6-08');
 
alter table corr 
order by date;

ALTER TABLE corr ADD COLUMN inter1 INT;

update corr
set inter1 = (
	select interest
	from lds
	where adddate(corr.date,1)=lds.date)
where inter1 is NULL;

#Caculate the Corr

select @ax := avg(x.interest), 
       @ay := avg(y.inter2),
       @div1 := stddev_samp(x.interest),
	   @div2 := stddev_samp(y.inter2)
from lds as x, corr as y;

select @num := count(*)
from lds;

SELECT SUM((inter1-@ax)*(inter2-@ay)/(@num-1)/(@div1*@div2)) as Correlation FROM corr;

