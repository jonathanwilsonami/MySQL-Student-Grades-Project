####################################################################
#This file creates 8 tables for DomainsA-D and StudentsA-D 
####################################################################

use Stat226;

#Drop table if I am re running the script. 
drop table if exists DomainA;
drop table if exists DomainB;
drop table if exists DomainC;
drop table if exists DomainD;
drop table if exists StudentsA;
drop table if exists StudentsB;
drop table if exists StudentsC;
drop table if exists StudentsD;

create table DomainA (
	ItemID integer,
	Domain varchar(255),
	Domain_num integer,
	Qnum integer,
	Form char(1)
);

create table DomainB (
	ItemID integer,
	Domain varchar(255),
	Domain_num integer,
	Qnum integer,
	Form char(1)
);

create table DomainC (
	ItemID integer,
	Domain varchar(255),
	Domain_num integer,
	Qnum integer,
	Form char(1)
);

create table DomainD (
	ItemID integer,
	Domain varchar(255),
	Domain_num integer,
	Qnum integer,
	Form char(1)
);

create table StudentsA (
	StudentID integer,
	Form char(1),
	Qnum integer,
	Score integer
);

create table StudentsB (
	StudentID integer,
	Form char(1),
	Qnum integer,
	Score integer
);

create table StudentsC (
	StudentID integer,
	Form char(1),
	Qnum integer,
	Score integer
);

create table StudentsD (
	StudentID integer,
	Form char(1),
	Qnum integer,
	Score integer
);

