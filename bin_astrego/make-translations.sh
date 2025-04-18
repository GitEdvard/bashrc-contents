#!/bin/bash
INDEX_FILE="/home/edvard/bin/bin_astrego/language_order.txt"
SEARCH_STR="$1"
TMP_FILE="${SEARCH_STR}.txt"

myline="${SEARCH_STR}"
while read LINE; do
    output=$(grep "${SEARCH_STR};" "$LINE")
    stripped="${output#*;}"
    myline="${myline};${stripped}"
done <"$INDEX_FILE"
echo $myline
echo "${myline}" > "$TMP_FILE"
