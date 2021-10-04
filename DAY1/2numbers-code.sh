#!/bin/bash

FILE=${1:-numbers.txt}

for i in `cat $FILE`; do for j in `cat $FILE`; do SUM=$(($i + $j)); if [[ $SUM -eq 2020 ]] ; then echo "here is the GOOD numbers $i $j"; break 2; fi; done; done
