#!/bin/bash
# without sleep phosh begins before openbox giving no way to see it
sleep 3
export XDG_RUNTIME_DIR=/tmp
export DISPLAY=:0
cage phoc -E "/usr/libexec/phosh -U" &
