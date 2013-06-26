#!/bin/bash
# Embedding Ctl-H in a string.

a=""

echo "abcdef"
echo
echo -n "abcdef$a"
# Space at end ^
#echo
#echo -n "abcdef$a "
# No space at end
# Two Ctl-H's -- backspaces
# ctl-V ctl-H, using vi/vim
# abcdef
# abcd f
#     ^ Backspaces twice.
# abcdef
#       ^ Doesn't backspace (why?).
# Results may not be quite as expected.

echo; echo
# Constantin Hagemeier suggests trying:
# a=$'\010\010'
# a=$'\b\b'
