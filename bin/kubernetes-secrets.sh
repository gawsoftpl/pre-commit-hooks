#!/usr/bin/env bash

was_no_encrypted=0
for file in "${@}";
do
    was_encrypted=`cat ${file} | grep 'kind: Secret'`
    was_encrypted2=`cat ${file} | grep 'kind: secret'`
    was_sops=`cat ${file} | grep 'sops:'`

    if [ ${#was_encrypted} -gt 0 ] || ([ ${#was_encrypted2} -gt 0 ] && [ ${#was_sops} -eq 0 ]);
    then
        echo "File ${file} has kubernetes secret is not encrypted"
        was_no_encrypted=1
    fi
done

if [ $was_no_encrypted -gt 0 ];
then
    exit 1
fi

exit 0