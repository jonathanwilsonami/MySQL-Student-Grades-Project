
##########################################################################
#This file is for insert statements. This will be applied on each of the 
#csv files. 
##########################################################################

{
 print "INSERT INTO Students"$2" (StudentID, Form, Qnum, Score) VALUES (" $1 ",'" $2 "'," $3 "," $4 ");"
}
