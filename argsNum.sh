args=$# # Number of args passed.
lastarg=${!args}

echo $args
echo $lastarg
# Note: This is an *indirect reference* to $args ...
# Or: lastarg=${!#} (Thanks, Chris Monson.)
# This is an *indirect reference* to the $# variable.
# Note that lastarg=${!$#} doesn't work.
