let "t2 = ((a = 9, 15 / 3))"
echo $t2
# Set "a = 9" and "t2 = 15 / 3"


for file in /{,usr/}bin/*calc
    #Find all executable files ending in "calc"
    #+in /bin and /usr/bin directories.
do
    if [ -x "$file" ]
    then
        echo $file
    fi
done
#

#/bin/ipcalc
#/usr/bin/kcalc
#/usr/bin/oidcalc
#/usr/bin/oocalc
# Thank you, Rory Winston, for pointing this out.

echo $$
