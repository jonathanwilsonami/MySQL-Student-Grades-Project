#Recreate the table as needed. 
drop table if exists lds;
drop table if exists weekdays;
drop table if exists lds2;
source HW4/initTable.sql;

#Create a 7x2 table that has 2 columns (one for the index and one for the day of the week)

CREATE TABLE weekdays (
	id INT not null AUTO_INCREMENT, 
	day CHARACTER(12),
	PRIMARY KEY (id)
);

describe weekdays;

insert into weekdays(day)
values ('Monday'), ("Tuesday"), ("Wednesday"), ("Thursday"), ("Friday"), ("Saturday"), ("Sunday");

 
#Add a column to the lds table with the weekday index number of the date

alter table lds add column weekday CHARACTER(12);

update lds as l
set weekday = (
    select day
    from weekdays as w
    where (weekday(l.date)+1)=w.id
)
where weekday is NULL;

create table lds2 select date, weekday, interest from lds;

select * from lds2 limit 10;
