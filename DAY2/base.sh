#!/bin/bash

function countchar()
{
    while IFS= read -r i; do printf "%s" "$i" | tr -dc "$1" | wc -m; done
}


function minposchar()
{
    i=`echo $2 | grep -ob $1 | head -1 | cut -f1 -d:`
    pos=$(($i+1))
    echo $pos
}
