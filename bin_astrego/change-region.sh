#!/bin/bash

# Check if an argument was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <region>"
  exit 1
fi

# Input argument
replacement="region=$1"

# File to modify
file="/astrego/region.ini"

# Regex pattern to match
pattern='region=[0-9]'

# Use sed to replace the pattern with the input argument
# The -i flag edits the file in place
sed -i "s/$pattern/$replacement/g" "$file"
