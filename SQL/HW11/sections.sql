drop table if exists finalzzz;

drop table if exists overallStudentszzz;
drop table if exists overallDomainszzz;
drop table if exists SectionA_zzz;
drop table if exists SectionB_zzz;

create table finalzzz (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, s.Form, s.Qnum, Domain_num, score
from Domainzzz as d
join Students as s on s.Form=d.Form and s.Qnum=d.Qnum; 

create table overallStudentszzz (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, 0 as Domain_num, sum(score) as Total, avg(score) as Mean  
from finalzzz 
group by StudentID;

create table overallDomainszzz (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, Domain_num, sum(score) as Total, avg(score) as Mean  
from finalzzz 
group by Domain_num, StudentID;

create table SectionA_zzz (StudentID INT(3) ZEROFILL NOT NULL)
select *
from overallStudentszzz
union
select *
from overallDomainszzz
order by StudentID, Domain_num;

create table SectionB_zzz (Qnum INT(3) ZEROFILL NOT NULL)
select Form, Qnum, avg(score) as Mean
from (select Form, Qnum, score from finalzzz) f
group by Form, Qnum
order by Form, Qnum;

