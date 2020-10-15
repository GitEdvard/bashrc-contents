#! /bin/bash
# Usage: -c <parent commit or branch> -u <username>
echo "starting"
declare -i arg_counter=$#

while getopts "c:u:" opt; do
	case $opt in
		c)
		    commit="${OPTARG}"
		    echo "captured option: $commit"
		    ;;
		u)
		    user="${OPTARG}"
		    echo "captioned option: $user"
		    ;;
		\?)
		    echo "Unknown option: ${OPTARG}"
		    exit 1
		    ;;
	esac
	arg_counter=$arg_counter-2
	shift 2
done


all_text="a long long string"

echo "Argument #1 is: $1"
echo "Argument #2 is: $2"
echo "Number arguments from counter: $arg_counter"
echo "Number of arguments from built in: $#"
echo "commit is $commit"
if [[ $"$all_text" == *"$commit"* && "1" == "1" ]]; then
    echo "found you!"
fi

echo "user is $user"

