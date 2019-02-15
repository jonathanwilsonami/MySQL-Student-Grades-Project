####################################################################
#This file creates a new table called 'Domain' with the 4 variables 
#listed in the headers of the csv files and additional variable
#of type char called 'Form' that has the Form letter. 
####################################################################

use Stat226;

#Drop table if I am re running the script. 
drop table if exists Domain;

create table Domain (
	ItemID integer,
	Domain varchar(255),
	DomainNum integer,
	QuestionNum integer,
	Form char(1)
);

