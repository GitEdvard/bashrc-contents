#! /bin/bash

_inner() {
    echo "in inner command"
    /home/edvard/bin/bin_home/hello.sh
}


echo "starting hello-trigger.sh"
_inner &
