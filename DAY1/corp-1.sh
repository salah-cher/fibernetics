#!/bin/bash

source base.sh
FILE=${1:-fiber-passwd.txt}
cat $FILE | while read val
        do
                MIN=`echo $val | awk '{print $1}' | cut -f1 -d-`
                MAX=`echo $val | awk '{print $1}' | cut -f2 -d-`
                CHAR=`echo $val | awk '{print $2}' | cut -f1 -d:`
                STR=`echo $val | awk '{print $3}'`
                POS=`minposchar $CHAR $STR`
                echo "min pos is $POS"
                COUNT=`echo $STR | countchar $CHAR`
                echo "count is $COUNT"

        	if (( $COUNT > $MAX  ||  $COUNT < $MIN ))
                then
        		echo "for this line $val this is a BAD password"
        		echo "$val  BAD" >> code1-BAD.txt
                else
        		echo "for this line $val this is a GOOD password"
        		echo "$val GOOD" >> code1-GOOD.txt
  		fi
	done

echo "Total good password is `wc -l code1-GOOD.txt`"
