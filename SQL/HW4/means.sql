#If the grader is confused as to what I am doing I am just writting a script that I run
#from the command line instead of tediously entering in commands over and over again. 

#Finding the means:
#Mean for Mondays:
select avg(interest) from (
		select interest 
		from lds 
		where weekday(date)=0
	) as monday;
#Ans: 26.7692

#Mean for weekends:
select avg(interest) from (
		select interest 
		from lds 
		where weekday(date)=5 or weekday(date)=6
	) as weekends;
#Ans: 54.2800

#Mean for weekdays:
select avg(interest) from (
		select interest 
		from lds 
		where weekday(date) in (0,1,2,3,4)
	) as weekends;
#Ans: 21.1385

#Max and min:
select min(interest) from lds;
#Ans: 14
select max(interest) from lds;
#Ans: 100
