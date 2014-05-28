#!/bin/bash
set -e
set -u

test "$(whoami)" = "root"

# set up APT mirrors
if [[ $(grep -c "deb mirror://" /etc/apt/sources.list) -eq 0 ]]; then
	echo "setting up APT mirrors"
	ed -s /etc/apt/sources.list <<-EOF
		0a
		deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse
		deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse
		deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse
		deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse
		.
		w
		EOF
fi
