function _show_contents () {
    if [[ "${#COMP_WORDS[@]}" == "2" ]]; then
	COMPREPLY=($(compgen -W "$(git ls-files -m -o --exclude-standard)" ""))
    fi
}

complete -F _show_contents show-contents.sh
