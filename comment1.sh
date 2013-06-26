
initial=( `cat "$startfile" | sed -e '/#/d' | tr -d '\n' |\
# Delete lines containing '#' comment character.
sed -e 's/\./\. /g' -e 's/_/_ /g'` )
# Excerpted from life.sh script
