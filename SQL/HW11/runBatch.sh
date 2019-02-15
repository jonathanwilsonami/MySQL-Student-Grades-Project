#!/bin/bash

#Remove previous files from other runs. Clean Final Results if already created. 
if [ -f read_sql.sql ] ; then
    rm read_sql.sql
fi

cat database.txt > read_sql.sql
#Loop through n number of files
for file in `ls data/Form?.csv`
do
	dos2unix -q $file #Convert dos file to unix format 
	letter=`echo $file | sed  's/..\/data\/Form//' | sed 's/.csv//' | sed 's/data\/Form//'` #Extract only the letter from $file
	
	cat sections.sql | sed 's/zzz/'$letter'/' >> read_sql.sql	

done
#add select statements
cat selects.sql >> read_sql.sql

mysql -u stats -p < read_sql.sql > result.txt
