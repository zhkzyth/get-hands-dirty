#!/bin/bash
#SCRIPT:  method2.sh
#PURPOSE: Process a file line by line with redirected while-read loop.

FILENAME=$1
count=0

while read LINE
do
      let count++
      echo "$count $LINE"

done < $FILENAME

echo -e "\nTotal $count Lines read"
