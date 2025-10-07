function _show_contents () {
    COMPREPLY=($(compgen -W "$(ls ~/bin/bin_*)" "${COMP_WORDS[1]}"))
}

complete -F _show_contents show-contents.sh
