#!/bin/sh
echo "START, please wait..."  

rootcheck() {
    [ $(id -u) -eq 0 ] && return 1 || return 0
}

# naive networkcheck
networkcheck() {
    ping -c 2 voidlinux.org > /dev/null && return 0 || return 1
}

printf "Run as root? \n"; rootcheck && echo [ok] || exit ; sleep 0.4
printf "Checking Connection: \n"; networkcheck && echo [ok] || exit ; sleep 0.4



# sudo ln -s /etc/sv/dhcpcd /var/service
# sudo sv start dhcpcd
# sleep 5

sudo xbps-install -Syu git
chmod +x $PWD/add-ons/*
$PWD/add-ons/zsh.sh
$PWD/add-ons/nvim.sh
$PWD/add-ons/basics.sh
$PWD/add-ons/sources.sh
$PWD/add-ons/xorg.sh
$PWD/add-ons/applications.sh
$PWD/add-ons/locales.sh
$PWD/add-ons/cleanup.sh