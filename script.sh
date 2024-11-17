#!/data/data/com.termux/files/usr/bin/bash
# kills all running termux x11 processes
kill -9 $(pgrep -f "termux.x11") 2>/dev/null
# pulseaudio
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1
# set display and run termux-x11 and virgl
export DISPLAY=:0
termux-x11 &
virgl_test_server_android &
# wait a bit for them to start
sleep 3
# run termux-x11 app itself
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
# logs into user account in proot-distro and runs openbox and the run.sh script at bottom
proot-distro login alpine --shared-tmp --user user -- /bin/sh -c 'export XDG_RUNTIME_DIR=/tmp && export DISPLAY=:0 && openbox & sh ~/run.sh'
