#!/bin/bash

SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

if [ ! -d "$TARGET_DIR" ]; then
  mkdir -p "$TARGET_DIR"
fi

if [ -r "$RM_LIST" ]
then
    while read FILE_NAME
    do
        if [ -e "$SOURCE_DIR/$FILE_NAME" ]
        then
            rm "$SOURCE_DIR/$FILE_NAME"
        fi
    done < "$RM_LIST"
fi

for FILE in "$SOURCE_DIR"/*; do
  if [ -e "$file" ]; then
    FILE_NAME=$(basename "$FILE")
    if [ ! -e "$TARGET_DIR/$FILE_NAME" ]; then
      mv "$FILE" "$TARGET_DIR"
    fi
  fi
done

for FILE_PATH in "$SOURCE_DIR"/*
do
    if [ -f "$FILE_PATH" ]
    then
        mv "$FILE_PATH" "$TARGET_DIR"
    elif [ -d "$FILE_PATH" ]
    then
        cp -r "$FILE_PATH" "$TARGET_DIR"
    fi
done

REMAINING_FILES_NUM=$(ls "$SOURCE_DIR" | wc -l)

if [ $REMAINING_FILES_NUM -gt 0 ]; then
     echo "cos zostalo"
     if [ $REMAINING_FILES_NUM -gt 1 ]; then
        echo "zostaly co najmniej 2 pliki"
        if [ $REMAINING_FILES_NUM -gt 3 ]; then
            echo "zostaly co najmniej 4 pliki"
        else
            echo "tutaj tez cos piszemy"
        fi
    fi
else
    echo "Kononowicz sie zgubil"
fi