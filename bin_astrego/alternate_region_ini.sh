#! /bin/bash

file1="/astrego/region.ini"
file2="/astrego/region_alternate.ini"
temp="/astrego/temp.ini"

# Swap contents
cp "$file1" "$temp"
cp "$file2" "$file1"
cp "$temp" "$file2"

# Optionally remove the temp file
rm "$temp"

