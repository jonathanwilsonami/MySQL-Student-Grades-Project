#!/bin/bash
#This script just helps me create my submission:

printf '1. This is load_domain.sh\n\n' > hw6.txt

cat load_domain.sh >> hw6.txt

printf '2. This is insert_template_domain.awk\n\n' >> hw6.txt
cat insert_template_domain.awk >> hw6.txt

printf '3. This is table_schema_domain.sql\n\n' >> hw6.txt
cat table_schema_domain.sql >> hw6.txt

printf '4. This is read_domain.sql. I added more lines because I added notes and other code before.\n\n' >> hw6.txt  

printf 'Head\n\n' >> hw6.txt
cat read_domain.sql | tail -n +20 | head -n 10 >> hw6.txt

printf 'Tail\n\n' >> hw6.txt
tail -n2 read_domain.sql >> hw6.txt
