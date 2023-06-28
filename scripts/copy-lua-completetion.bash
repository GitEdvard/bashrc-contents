function _show_lua () {
    COMPREPLY=($(compgen -W "$(ls ~/sources/admin/VimFiles/lua)" "${COMP_WORDS[1]}"))
}

complete -F _show_lua copy-lua.sh

