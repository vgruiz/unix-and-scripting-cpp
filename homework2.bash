#!/bin/bash
function comchar(){
    case "$1" in
	java|cpp|c)
	    echo '//'
	    ;;
	list|elisp)
	    echo ';'
	    ;;
	*)
	    echo '#'
	    ;;
    esac
}
##################################
# The output should contain:
#      - the total number of lines
#      - the number of lines containing only comments
#      - the number of blank lines
#      - the number of lines containing only '{' or '}'
#      - The number of actual code lines
##################################

C=$(comchar $2)

num_lines=$( wc -l $1 | cut -f 1 -d ' ' )
num_comments=$(grep -c ^$C $1)
num_blank=$(grep -c '^\s*$' $1)
num_brackets=$(grep -c ^\s*[{}]\s*$ $1)
num_code=$(( $num_lines-$num_comments-$num_blank-$num_brackets))

echo "Total Lines    :  $num_lines"
echo "Comments       :  $num_comments"
echo "Blank Lines    :  $num_blank"
echo "Only Braces    :  $num_brackets"
echo "Actual Code    :  $num_code"
