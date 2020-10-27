#! /bin/bash
# Toggles from straight autocompletion to cyclic autocompletion

function _bind_tab() {
    bind Tab:menu-complete
}

_bind_tab
