
############################################################
#Read SQL
###########################################################

use Stat226;

drop table if exists finalA;

drop table if exists overallStudentsA;
drop table if exists overallDomainsA;
drop table if exists SectionA_A;
drop table if exists SectionB_A;

create table finalA (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, s.Form, s.Qnum, Domain_num, score
from DomainA as d
join Students as s on s.Form=d.Form and s.Qnum=d.Qnum; 

create table overallStudentsA (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, 0 as Domain_num, sum(score) as Total, avg(score) as Mean  
from finalA 
group by StudentID;

create table overallDomainsA (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, Domain_num, sum(score) as Total, avg(score) as Mean  
from finalA 
group by Domain_num, StudentID;

create table SectionA_A (StudentID INT(3) ZEROFILL NOT NULL)
select *
from overallStudentsA
union
select *
from overallDomainsA
order by StudentID, Domain_num;

create table SectionB_A (Qnum INT(3) ZEROFILL NOT NULL)
select Form, Qnum, avg(score) as Mean
from (select Form, Qnum, score from finalA) f
group by Form, Qnum
order by Form, Qnum;

drop table if exists finalB;

drop table if exists overallStudentsB;
drop table if exists overallDomainsB;
drop table if exists SectionA_B;
drop table if exists SectionB_B;

create table finalB (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, s.Form, s.Qnum, Domain_num, score
from DomainB as d
join Students as s on s.Form=d.Form and s.Qnum=d.Qnum; 

create table overallStudentsB (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, 0 as Domain_num, sum(score) as Total, avg(score) as Mean  
from finalB 
group by StudentID;

create table overallDomainsB (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, Domain_num, sum(score) as Total, avg(score) as Mean  
from finalB 
group by Domain_num, StudentID;

create table SectionA_B (StudentID INT(3) ZEROFILL NOT NULL)
select *
from overallStudentsB
union
select *
from overallDomainsB
order by StudentID, Domain_num;

create table SectionB_B (Qnum INT(3) ZEROFILL NOT NULL)
select Form, Qnum, avg(score) as Mean
from (select Form, Qnum, score from finalB) f
group by Form, Qnum
order by Form, Qnum;

drop table if exists finalC;

drop table if exists overallStudentsC;
drop table if exists overallDomainsC;
drop table if exists SectionA_C;
drop table if exists SectionB_C;

create table finalC (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, s.Form, s.Qnum, Domain_num, score
from DomainC as d
join Students as s on s.Form=d.Form and s.Qnum=d.Qnum; 

create table overallStudentsC (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, 0 as Domain_num, sum(score) as Total, avg(score) as Mean  
from finalC 
group by StudentID;

create table overallDomainsC (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, Domain_num, sum(score) as Total, avg(score) as Mean  
from finalC 
group by Domain_num, StudentID;

create table SectionA_C (StudentID INT(3) ZEROFILL NOT NULL)
select *
from overallStudentsC
union
select *
from overallDomainsC
order by StudentID, Domain_num;

create table SectionB_C (Qnum INT(3) ZEROFILL NOT NULL)
select Form, Qnum, avg(score) as Mean
from (select Form, Qnum, score from finalC) f
group by Form, Qnum
order by Form, Qnum;

drop table if exists finalD;

drop table if exists overallStudentsD;
drop table if exists overallDomainsD;
drop table if exists SectionA_D;
drop table if exists SectionB_D;

create table finalD (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, s.Form, s.Qnum, Domain_num, score
from DomainD as d
join Students as s on s.Form=d.Form and s.Qnum=d.Qnum; 

create table overallStudentsD (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, 0 as Domain_num, sum(score) as Total, avg(score) as Mean  
from finalD 
group by StudentID;

create table overallDomainsD (StudentID INT(3) ZEROFILL NOT NULL)
select StudentID, Domain_num, sum(score) as Total, avg(score) as Mean  
from finalD 
group by Domain_num, StudentID;

create table SectionA_D (StudentID INT(3) ZEROFILL NOT NULL)
select *
from overallStudentsD
union
select *
from overallDomainsD
order by StudentID, Domain_num;

create table SectionB_D (Qnum INT(3) ZEROFILL NOT NULL)
select Form, Qnum, avg(score) as Mean
from (select Form, Qnum, score from finalD) f
group by Form, Qnum
order by Form, Qnum;


select * from SectionA_D limit 14;

select * from SectionB_D limit 5;

