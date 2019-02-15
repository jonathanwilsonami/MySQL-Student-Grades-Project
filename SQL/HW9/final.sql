############################################################
#"Final" table that includes StudentID, Form, Qnum, Score, 
#and Domain_num.
###########################################################

use Stat226;

drop table if exists final;
drop table if exists overallStudents;
drop table if exists overallStudentsTemp;
drop table if exists overallDomains;
drop table if exists studentScores;
drop table if exists questionAnalysis;

create table final (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, s.Form, Qnum, DomainNum, score
from Domain as d
join Students as s on s.Form=d.Form and s.Qnum=d.QuestionNum; 


create table overallStudentsTemp (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, sum(score) as Total, avg(score) as Mean  
from final 
group by StudentID;

alter table overallStudentsTemp
add DomainNum int 
default 0;

create table overallStudents (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, DomainNum, Total, Mean
from overallStudentsTemp; 

create table overallDomains (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, DomainNum, sum(score) as Total, avg(score) as Mean  
from final 
group by DomainNum, StudentID;

create table studentScores (StudentID INT(3) ZEROFILL NOT NULL)
select *
from overallStudents
union
select *
from overallDomains
order by StudentID, DomainNum;

create table questionAnalysis (Qnum INT(3) ZEROFILL NOT NULL)
select Form, Qnum, avg(score) as Mean
from (select Form, Qnum, score from final) f
group by Form, Qnum
order by Form, Qnum;

select * from studentScores limit 10;
select * from studentScores order by StudentID desc, DomainNum desc limit 10;

select * from questionAnalysis limit 10;
select * from questionAnalysis order by Form desc, Qnum desc limit 10;
