
if /usr/bin/[ -z "$1" ]
# Again, functionally identical to above.
# if /usr/bin/[ -z "$1"
# Works, but gives an error message.
#
# Note:
#This has been fixed in Bash, version 3.x.
then
   echo "No command-line arguments."
else
   echo "First command-line argument is $1."
fi
