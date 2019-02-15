#!/bin/bash
###############################################################
#This file is and executable for all other scripts              
#That will create the Students table in mysql.                
#Create read_students.sql.  
###############################################################

#Remove previous files from other runs. Clean Final Results if already created. 
if [ -f read_students.sql ] ; then
    rm read_students.sql
fi

#touch read_students.sql
cat table_schema_students.sql > read_students.sql

#Loop through n number of files
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
	
	cat student_results | awk -f insert_template_students.awk >> read_students.sql #Removing the -F helped

done

mysql -u stats -p < read_students.sql

#Remove files that are not needed
rm student_answers.csv 
rm answer_key.csv 
rm student_results 
rm ResultsNum.R 
rm student_results.R

