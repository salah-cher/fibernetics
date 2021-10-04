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
		if [[ $POS = $MIN ]]
        		then
        			echo "GOOD position $POS $MIN for $CHAR at $STR"
					#if [[ $COUNT -eq 1 ]] 
					M=$(($MAX - 1))
					echo "M value is $M"
					NEXT=`echo $STR | grep -o -b $CHAR | grep $M | wc -l`
					echo " NEXT value is $NEXT"
					if [[ $NEXT -eq 0 ]]
					then 
			 		echo "$val" >> code2-GOOD.txt
					#else
					#	echo "BAD  $COUNT for $CHAR at $STR"
					fi
			else
        			echo "BAD position $POS $MIN for $CHAR at $STR"
		fi
	done

echo "The number of Valid Password According to new Policy is `wc -l code2-GOOD.txt`"
