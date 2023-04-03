#!/bin/bash

PATH_1=${2:-path1}
PATH_2=${2:-path2}

if [ $# -eq 0 ]
  then
    echo "No arguments!"
    exit 125
fi

FILES=$(ls ${PATH_1})

if ! [ -d "${PATH_1}" ]
then
    echo "No such dir!"
    exit 125
fi

echo "${FILES} po plikach"

for ITEM in ${FILES};
do
    if [[ -f ${ITEM} ]]; then
        echo "$ITEM is a file"
    elif [[ -d ${ITEM} ]]; then
        echo "$ITEM is a directory"
    elif [[ -L ${ITEM} ]]; then
        echo "$ITEM is link"
    fi
done

for ITEM in ${FILES}/*;
do
    NAME="$(basename -- $ITEM)"
    CAPITALISED=${ITEM^^}
    END="_ln.txt"
    FINAL_NAME="$CAPITALISED$END"
    echo "${FINAL_NAME}"
    ln -s ${PATH_1/${ITEM}} ${PATH_2/${FINAL_NAME}}
done