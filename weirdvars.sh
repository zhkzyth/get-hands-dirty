#!/bin/bash
# weirdvars.sh: Echoing weird variables.
echo
var="'(]\\{}\$\""
echo $var
# '(]\{}$"
echo "$var"
# '(]\{}$" Doesn't make a difference.

echo

#IFS='\'
echo $var
echo "$var" # '(] {}$" # '(]\{}$"   \ converted to space. Why?

# Examples above supplied by Stephane Chazelas.

echo

var2="\\\\\""
echo $var2 #   "
echo "$var2" # \\"
echo
# But ... var2="\\\\"" is illegal. Why?
var3='\\\\'
echo "$var3"   # \\\\
# Strong quoting works, though.


echo "Why can't I write 's between single quotes"
echo
# The roundabout method.
echo 'Why can'\''t I write '"'"'s between single quotes'
#    |-------|  |----------|   |-----------------------|
# Three single-quoted strings, with escaped and quoted single quotes between.
# This example courtesy of Stéphane Chazelas.

exit $?
