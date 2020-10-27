#! /bin/bash
# Toggles from cyclic autocompletion to straight autocompletion

function _bind_tab() {
    bind Tab:complete
}

_bind_tab
