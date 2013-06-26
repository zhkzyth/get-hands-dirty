#Simple escaping and quoting...
echo \z      # z
echo \\z     # \z
echo '\z'    # z
echo '\\z'   # \\z
echo "\z"    # \z
echo "\\z"   # \z

#command substituation  ?????
echo `echo \z`     # z
echo `echo \\z`    # z
echo `echo \\\z`   # \z
echo `echo \\\\z`  # \z
echo `echo \\\\\\z` #\z
echo `echo \\\\\\\z` #\\z
echo `echo "\z"`  # \z
echo `echo "\\z"`   #\z

#Here document
cat <<EOF
\z
EOF

cat <<test
\\z
test
