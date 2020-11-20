#! /bin/bash
# Show git commit message together with git diff

if [[ $# -ne 1 ]]; then
	echo "Usage: git-log.sh <commit hash>"
	exit 1
fi

git log "$1" --no-walk
git-diff-commit.sh "$1"
