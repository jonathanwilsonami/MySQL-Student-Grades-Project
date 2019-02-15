##########################################################################
#This file is for insert statements. This will be applied on each of the 
#csv files. 
##########################################################################

{
 print "INSERT INTO Students (StudentID, Form, Qnum, Score) VALUES (" $1 ",'" $2 "'," $3 "," $4 ");"
}
