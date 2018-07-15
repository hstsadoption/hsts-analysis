#!/bin/bash
FILE_TYPE=$(file -b "$2")
if [ "$FILE_TYPE" == "XZ compressed data" ]; then
	xz -d --stdout "$2" | grep -a -F "$1" | wc -l
else
	grep -a -F "$1" "$2" | wc -l
fi

