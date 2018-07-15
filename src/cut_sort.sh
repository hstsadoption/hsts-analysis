#!/bin/bash
FILE_TYPE=$(file -b "$1")
if [ "$FILE_TYPE" == "XZ compressed data" ]; then
    xz -d --stdout "$1" | tail -n +2 | ./csvquote/csvquote | cut -d ',' -f 1,3,6,7 | LC_ALL=C sort -t ',' -k 2 | uniq -u | ./csvquote/csvquote -u > "$2"
else
    tail -n +2 "$1" | ./csvquote/csvquote | cut -d ',' -f 1,3,6,7 | LC_ALL=C sort -t ',' -k 2 | uniq -u | ./csvquote/csvquote -u > "$2"
fi

