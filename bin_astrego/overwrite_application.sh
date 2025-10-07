#! /bin/bash

current_file="/astrego/application.ini"
alternate_file="/astrego/application_alternate.ini"

# Swap contents
cp "$current_file" "$alternate_file"
cp "/astrego/$1" "/astrego/application.ini"
