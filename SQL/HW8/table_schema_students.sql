####################################################################
#This file creates a new table called 'Students'  
####################################################################

use Stat226;

#Drop table if I am re running the script. 
drop table if exists Students;

create table Students (
	StudentID integer,
	Form char(1),
	Qnum integer,
	Score integer
);

