function _show_astrego_dir () {
    COMPREPLY=($(compgen -W "$(ls /astrego/)" "${COMP_WORDS[1]}"))
}

complete -F _show_astrego_dir overwrite_application.sh
complete -F _show_astrego_dir overwrite_region.sh

