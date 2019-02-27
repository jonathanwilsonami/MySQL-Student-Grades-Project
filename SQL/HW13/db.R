#Create db connection object
#install.packages("RMySQL")
library('RMySQL')
library('magrittr')
library('dplyr')
library('rowr')
options(max.print=10000)
m <- dbDriver("MySQL")
con <- dbConnect(m,user='stat226', password='cougars19',host='statdb.byu.edu',dbname='stat226')
dbFetch(dbSendQuery(con, "show tables"), n = -1)

#Get data
#Students 183, 3, 61, 86, 177
student_data <- dbFetch(dbSendQuery(con, 
"SELECT Students.StudentID, Students.Form, Students.Qnum, Students.Score, Domain.Domain_num 
From Students
JOIN Domain ON (Students.Qnum=Domain.Qnum AND Students.Form=Domain.Form)
WHERE StudentID in (183, 3, 86, 61, 177)"), 
n = -1)

domain <- student_data %>% group_by(StudentID, Domain_num) %>% 
	summarize(Total = sum(Score), Mean = mean(Score)*100) 
domain <- data.frame(domain)

overall <- student_data %>% group_by(StudentID) %>% 
	summarize(Domain_num = 0, Total = sum(Score), Mean = mean(Score)*100)
overall <- data.frame(overall)

#Don't do this
student_table <- insertRows(domain, overall[1,], 1)
student_table <- insertRows(student_table, overall[2,], 7)
student_table <- insertRows(student_table, overall[3,], 13)
student_table <- insertRows(student_table, overall[4,], 19)
student_table <- insertRows(student_table, overall[5,], 25)

student_table$Mean <- round(student_table$Mean, 2)
#student_table

#Push to db
conw <- dbConnect(m,user='stats',password='stats',host='localhost',dbname='Stat226')
dbWriteTable(conw, value = student_table, name = "student_table", append = FALSE ) 
