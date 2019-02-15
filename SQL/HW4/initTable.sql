#To Run: mysql>source HW4/initTable.sql

#Clears old table
drop table if exists lds;

CREATE TABLE lds (
 char_date CHARACTER(10),
 interest INTEGER 
);

#Get data from file. 
source cr4.sql;

#Add a new column of date date type to lds table
alter table lds 
	ADD date DATE null;

#Copy values from on col to the new one with the date datatype	
update lds set date = str_to_date(char_date, '%m/%d/%Y');

#Drop col
alter table lds	
drop column char_date;

select * from lds limit 5;

#Describe table:
describe lds;


