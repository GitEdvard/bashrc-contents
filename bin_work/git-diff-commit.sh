#! /bin/bash
# Show git diff for a particular commit. Usage: git-diff-commit.sh <commit>

if [[ $# -eq 0 ]]; then
	echo "Usage: git-diff-commit.sh <commit hash>"
	exit 1
fi

git diff "$1~1" "$1"

