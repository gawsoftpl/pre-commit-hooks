#!/usr/bin/env bash

dir=$1

if [ ! -d $dir ];
then
    echo "$dir not exists"
    exit 1
fi

was_no_encrypted=0
for file in $(find . -iname "$dir" -type f );
do
    was_encrypted=`cat ${file} | grep 'BEGIN AGE ENCRYPTED FILE'`
    if [ ${#was_encrypted} -eq 0 ];
    then
        echo "File ${file} is not encrypted"
        was_no_encrypted=1
    fi
done

if [ $was_no_encrypted -gt 0 ];
then
    exit 1
fi

exit 0