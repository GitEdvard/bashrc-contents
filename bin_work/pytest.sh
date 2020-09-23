#! /bin/bash
# Run pytest without logs!!

command="pytest --no-print-logs --log-level=\"WARN\""

while getopts "m:" opt; do
    case $opt in
	m)
	    echo "found otional arg"
	    command=$command" -m ${OPTARG}"
	    ;;
	\?)
	    echo "Unknown optional argument"
	    exit 1
    esac
done

command=$command" $1"

echo "$command"

eval "$command"
