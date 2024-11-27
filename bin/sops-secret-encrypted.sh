#!/usr/bin/env bash


was_no_encrypted=0
file=$1

was_encrypted=`cat ${file} | grep '"sops": '`
if [ ${#was_encrypted} -eq 0 ];
then
    echo "File ${file} is not encrypted"
    was_no_encrypted=1
fi

if [ $was_no_encrypted -gt 0 ];
then
    exit 1
fi

exit 0