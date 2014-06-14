#!/bin/bash
set -e
set -u

DEST=~/.liquidprompt

[ ! -d "$DEST" ] && git clone https://github.com/nojhan/liquidprompt.git "$DEST" ||:
cd "$DEST"
git pull

SOURCE_CMD=". \"$DEST/liquidprompt\""
$(grep -c "$SOURCE_CMD" ~/.bashrc) -eq 0 && echo $SOURCE_CMD >> ~/.bashrc ||:

. ~/.bashrc
