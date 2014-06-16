#!/bin/bash
set -e
set -u

DEST=~/.liquidprompt

[ ! -d "$DEST" ] && git clone https://github.com/nojhan/liquidprompt.git "$DEST" ||:
cd "$DEST"
git pull

SOURCE_CMD=". \"$DEST/liquidprompt\""
test $(grep -c "$SOURCE_CMD" ~/.bashrc) -eq 0 && echo $SOURCE_CMD >> ~/.bashrc ||:

if [ ! -f ~/.liquidpromptrc ]; then
	cat > ~/.liquidpromptrc <<-OEF
	LP_ENABLE_BATT=0
	LP_ENABLE_BZR=0
	LP_ENABLE_FOSSIL=0
	LP_ENABLE_GIT=1
	LP_ENABLE_HG=0
	LP_ENABLE_JOBS=0
	LP_ENABLE_LOAD=0
	LP_ENABLE_PERM=0
	LP_ENABLE_PROXY=0
	LP_ENABLE_RUNTIME=0
	LP_ENABLE_SCREEN_TITLE=0
	LP_ENABLE_SHORTEN_PATH=0
	LP_ENABLE_SSH_COLORS=1
	LP_ENABLE_SVN=0
	LP_ENABLE_TEMP=0
	LP_ENABLE_TIME=0
	LP_ENABLE_TITLE=0
	LP_ENABLE_VCS_ROOT=0
	LP_ENABLE_VIRTUALENV=1
	OEF
fi


green='\e[0;32m'
rs='\e[0m'

echo -e "${green}liquidprompt installed.${rs} Now type: . ~/.bashrc"
