#!/bin/bash

FILE=${1:-numbers.txt}

for i in `cat $FILE`; do for j in `cat $FILE`; do for k in `cat numbers.txt`; do SUM=$(($i+$j+$k)); if [[ $SUM -eq 2020 ]] ; then echo "here is the good numbers $i $j $k"; break 3; fi; done; done; done
