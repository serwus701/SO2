#!/bin/bash

SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

if [ ! -d "$TARGET_DIR" ]; then
  echo "Katalog $TARGET_DIR nie istnieje, tworzę..."
  mkdir -p "$TARGET_DIR"
fi

while read -r file_name; do
  if [ -e "$SOURCE_DIR/$file_name" ]; then
    echo "Usuwanie pliku/katalogu $file_name..."
    rm -r "$SOURCE_DIR/$file_name"
  fi
done < "$RM_LIST"

for file in "$SOURCE_DIR"/*; do
  if [ -e "$file" ]; then
    file_name=$(basename "$file")
    if [ ! -e "$TARGET_DIR/$file_name" ]; then
      echo "Przenoszenie pliku/katalogu $file_name do $TARGET_DIR..."
      mv "$file" "$TARGET_DIR"
    fi
  fi
done