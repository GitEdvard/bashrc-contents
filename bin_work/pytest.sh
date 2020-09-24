#! /bin/bash
# Run pytest without logs!!

command="pytest --no-print-logs --log-level=\"WARN\""

command=$command" $@"

eval "$command"
