#!/bin/bash
#This script just helps me create my submission:

printf '1. This is the template sql file\n\n' > hw11.txt

cat sections.sql >> hw11.txt

printf '2. This is runBatch.sh\n\n' >> hw11.txt
cat runBatch.sh >> hw11.txt

printf '3. This is output after running my shell script\n\n' >> hw11.txt
printf 'NOTE: That I am using Form D...\n\n' >> hw11.txt
cat result.txt >> hw11.txt

