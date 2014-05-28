#!/bin/bash
set -e
set -u
YELLOW="\033[33m"
RS="\033[0m"

test "$(whoami)" = "root"

## install docker
apt-get install -y docker.io

## alias docker.io to docker
ln -sf /usr/bin/docker.io /usr/local/bin/docker
if [[ $(egrep -c '^complete -F _docker docker$' /etc/bash_completion.d/docker.io) -eq 0 ]]; then
        echo "complete -F _docker docker" >> /etc/bash_completion.d/docker.io
fi

echo -e "${YELLOW}Add users to the 'docker' group${RS}"
