#! /bin/bash

current_file="/astrego/region.ini"
alternate_file="/astrego/region_alternate.ini"

# Swap contents
cp "$current_file" "$alternate_file"
cp "/astrego/$1" "/astrego/region.ini"
