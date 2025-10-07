#! /bin/bash

file1="/astrego/application.ini"
file2="/astrego/application_alternate.ini"
temp="/astrego/temp.ini"

# Swap contents
cp "$file1" "$temp"
cp "$file2" "$file1"
cp "$temp" "$file2"

# Optionally remove the temp file
rm "$temp"
