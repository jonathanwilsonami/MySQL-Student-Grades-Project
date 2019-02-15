#!/bin/bash
#This script just helps me create my submission:

printf '1. This is load_students.sh\n\n' > hw8.txt

cat load_students.sh >> hw8.txt

printf '2. This is insert_template_students.awk\n\n' >> hw8.txt
cat insert_template_students.awk >> hw8.txt

printf '3. This is table_schema_students.sql\n\n' >> hw8.txt
cat table_schema_students.sql >> hw8.txt

printf '4. This is read_domain.sql.\n\n' >> hw8.txt  

printf 'Head\n\n' >> hw8.txt
cat read_students.sql | tail -n +17 | head -n 10 >> hw8.txt

printf 'Tail\n\n' >> hw8.txt
tail -n2 read_students.sql >> hw8.txt
