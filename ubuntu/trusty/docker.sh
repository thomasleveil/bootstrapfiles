#!/bin/bash
set -e
set -u

test "$(whoami)" = "root"

apt-get install -y docker.io

## alias docker.io to docker
ln -sf /usr/bin/docker.io /usr/local/bin/docker
if [[ $(egrep -c '^complete -F _docker docker$' /etc/bash_completion.d/docker.io) -eq 0 ]]; then
	echo "complete -F _docker docker" >> /etc/bash_completion.d/docker.io
fi