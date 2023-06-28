function _show_plugfile () {
    COMPREPLY=($(compgen -W "$(ls ~/sources/admin/VimFiles/myplugfiles)" "${COMP_WORDS[1]}"))
}

complete -F _show_plugfile copy-plug.sh

