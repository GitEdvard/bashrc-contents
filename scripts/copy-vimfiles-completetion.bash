function _show_vimfiles () {
    COMPREPLY=($(compgen -W "$(ls ~/sources/admin/VimFiles)" "${COMP_WORDS[1]}"))
}

complete -F _show_vimfiles copy-vimfiles.sh

