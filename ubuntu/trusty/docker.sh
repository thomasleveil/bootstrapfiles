#!/bin/bash
set -e
set -u
set -o pipefail
YELLOW="\033[33m"
RS="\033[0m"

function my_trap_handler()
{
        MYSELF="$0"               # equals to my script name
        LASTLINE="$1"            # argument 1: last line of error occurence
        LASTERR="$2"             # argument 2: error code of last command
        echo "${MYSELF}: line ${LASTLINE}: exit status of last command: ${LASTERR}"
}
trap 'my_trap_handler ${LINENO} ${$?}' ERR
######################################################################################

test "$(whoami)" = "root"


## install docker
curl -sL https://get.docker.io/ | sh
curl -sL https://raw.githubusercontent.com/dotcloud/docker/master/contrib/completion/bash/docker > /etc/bash_completion.d/docker


echo -e "${YELLOW}Add users to the 'docker' group${RS}"
