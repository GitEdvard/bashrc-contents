#! /bin/bash
# Run pytest without logs!!

command="pytest --disable-pytest-warnings"

command=$command" $@"

eval "$command"
