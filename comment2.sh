echo "The # here does not begin a comment."
echo 'The # here does not begin a comment.'
echo The \# here does not begin a comment.
echo The # here begins a comment.

#echo ${PATH#*:}  # Parameter substitution, not a comment.
echo $(( 2#11111111 )) # Base conversion, not a comment.
# Thanks, S.C.
