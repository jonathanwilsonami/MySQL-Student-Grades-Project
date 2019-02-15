#!/bin/bash
#This script just helps me create my submission:

printf '1. This is runBatch.sh\n\n' > hw10.txt

cat runBatch.sh >> hw10.txt

printf '2. These are the awk scripts\n\n' >> hw10.txt
cat insert_student.awk >> hw10.txt
cat insert_domain.awk >> hw10.txt

printf '3. This is table schema\n\n' >> hw10.txt
cat table_schema.sql >> hw10.txt

printf '4. Last 10 results.\n\n' >> hw10.txt  

printf 'Tail\n\n' >> hw10.txt
tail -n10 read.sql >> hw10.txt
