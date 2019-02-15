#!/bin/bash
#Remove previous files from other runs. Clean Final Results if already created. 
if [ -f read.sql ] ; then
    rm read.sql
fi

#touch read.sql
cat table_schema.sql > read.sql

#Loop through domains
for file in `ls data/Domains_Form?.csv`
do
	letter=`echo $file | sed  's/..\/data\/Domains_Form//' | sed 's/.csv//' | sed 's/data\/Domains_Form//'` #Extract only the letter from $file
	dos2unix -q $letter.csv #Convert dos file to unix format 
	#Gets rid of the headers and puts in all the insert statements.
	grep -v ItemId data/Domains_Form$letter.csv | sed -e s/$/,"$letter"/ | awk -F, -f insert_domain.awk >> read.sql
done

#Loop through students
for file in `ls data/Form?.csv`
do
	dos2unix -q $file #Convert dos file to unix format 
	letter=`echo $file | sed  's/..\/data\/Form//' | sed 's/.csv//' | sed 's/data\/Form//'` #Extract only the letter from $file
	#Create data sets
	grep 'KEY' $file > answer_key.csv; grep -v 'KEY' $file > student_answers.csv
	
	#Run R scripts
	Rscript ConvertLetToBinary.R student_answers.csv answer_key.csv ResultsNum.R
	Rscript ConvertWidetoLongFormat.R ResultsNum.R student_results.R
	
	#Data Cleaning the result data set
	sed -i 's/\"//g' student_results.R
	awk -f NumSort.awk student_results.R > student_results
	
	cat student_results | awk -f insert_student.awk >> read.sql #Removing the -F helped

done

mysql -u stats -p < read.sql

#Order of turning in: shell, awk, sql (create table), first 10 lines and last 2 of read.sql. 

