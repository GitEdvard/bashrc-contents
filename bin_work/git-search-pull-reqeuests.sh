#! /bin/bash
# Usage: <parent commit or branch> <username>

while getopts "s:" opt; do
	case $opt in
		s)
		    free_search="${OPTARG}"
		    ;;
		\?)
		    echo "Unknown option: ${OPTARG}"
		    exit 1
		    ;;
	esac
	shift 2
done


if [[ $# -ne 2 ]]; then
	echo "Usage: [-s free search] <parent commit> <git user name>"
	exit 1
fi

git rev-list --merges "$1" |
    while read rev; do
        p2=$(git rev-parse ${rev}^2)
        person=$(git log --no-walk --pretty=format:%cn $p2)
	all_text=$(git log --no-walk ${rev})
	if [[ "$person" == "$2" && $all_text == *"$free_search"* ]]; then
	    echo $rev
	fi
	
    done |
    git log --stdin --no-walk # add formatting etc as desired

