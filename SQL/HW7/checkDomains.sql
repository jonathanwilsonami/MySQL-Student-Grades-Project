#########################################
#This query shows if the 4 forms have 
#different domain number-category pairs.
#The pairs need to be the same across
#all forms. 
########################################

use Stat226;
drop table if exists formA;
drop table if exists formB;
drop table if exists formC;
drop table if exists formD;

#There may be a better way than brute force creation of 
#many tables but I did not have much time to get this done so
#here we are. 

create table formA 
	select distinct(Domain), DomainNum
	from Domain
	where Form='A';

create table formB 
	select distinct(Domain), DomainNum
	from Domain
	where Form='B';

create table formC 
	select distinct(Domain), DomainNum
	from Domain
	where Form='C';

create table formD 
	select distinct(Domain), DomainNum
	from Domain
	where Form='D';

#What we really want to do is create an intersection however, 
#mysql does not support that operator so here I improvise by using
#distinct and the union opertator to ensure that I have 
#the domains I want.

select distinct(Domain), DomainNum
from formA
where
	Domain in (select distinct(Domain) from formB
				union
				select distinct(Domain) from formC
				union 
				select distinct(Domain) from formD);
