#!/bin/bash

######################################

#

# Display a random word from the dictioary which does not have an apostrophy.

#

######################################



no_apos_words=$(grep -v \' /usr/share/dict/words| wc -l)

num=$(( ($RANDOM % $no_apos_words) ))

t0=$(grep -v \' /usr/share/dict/words| head -n $num | tail -n +$num)

echo $t0



######################################

# The issue in this code is in the limitation of the $RANDOM environment

# variable.

# $RANDOM is limited to numbers from 0 to 32767.

# So even though I attempt to generate a random number between 0 and the

# number of words w/o apostrophies, 72945, we are still only given values

# from 0 to 32767.

# This means the potential random words we echo is not using the full list

# of words, only the first 32768 words.

######################################
