#!/bin/bash 
# Reading lines in /etc/fstab 

File=/etc/fstab

{
read line1
read line2
} < $File

echo "First line in $File is:"
echo "$line1"
echo 
echo "second line in $File is:"
echo "$line2"

exit 0
