#!/bin/bash
###############################################################
#This file is and executable for all other scripts            #  
#That will create the Domain table in mysql.                  #
#Create read_domain.sql. This file must have all the commands #
#required to create Domain table inside of Stat226 database.  #
###############################################################

#Remove previous files from other runs. Clean Final Results if already created. 
if [ -f read_domain.sql ] ; then
    rm read_domain.sql
fi

#touch read_domain.sql
cat table_schema_domain.sql > read_domain.sql

#Loop through n number of files
for file in `ls data/Domains_Form?.csv`
do
	letter=`echo $file | sed  's/..\/data\/Domains_Form//' | sed 's/.csv//' | sed 's/data\/Domains_Form//'` #Extract only the letter from $file
	dos2unix -q $letter.csv #Convert dos file to unix format 
	#Gets rid of the headers and puts in all the insert statements.
	grep -v ItemId data/Domains_Form$letter.csv | sed -e s/$/,"$letter"/ | awk -F, -f insert_template_domain.awk >> read_domain.sql
done

mysql -u stats -p < read_domain.sql

#Order of turning in: shell, awk, sql (create table), first 10 lines and last 2 of read.sql. 

