#!/bin/bash
set -e
set -u

DEST=~/.liquidprompt

[ ! -d "$DEST" ] && git clone https://github.com/nojhan/liquidprompt.git "$DEST" ||:
cd "$DEST"
git pull

SOURCE_CMD=". \"$DEST/liquidprompt\""
test $(grep -c "$SOURCE_CMD" ~/.bashrc) -eq 0 && echo $SOURCE_CMD >> ~/.bashrc ||:

green='\e[0;32m'
rs='\e[0m'

echo -e "${green}liquidprompt installed.${rs} Now type: . ~/.bashrc"
