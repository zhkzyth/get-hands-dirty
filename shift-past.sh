# However, as Eleni Fragkiadaki, points out,
#+ attempting a 'shift' past the number of
#+ positional parameters ($#) returns an exit status of 1,
#+ and the positional parameters themselves do not change.
# This means possibly getting stuck in an endless loop. . . .
# For example:
#
until [ -z "$1" ]
#
do
#
   echo -n "$1 "
#
   shift 20 || break #if i have a try,may i can fix it
# If less than 20 pos params,
#
done
#+ then loop never ends!
#
# When in doubt, add a sanity check. . . .
# shift 20 || break
#          ^^^^^^^^
