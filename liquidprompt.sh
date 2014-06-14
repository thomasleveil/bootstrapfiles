#!/bin/bash
set -e
set -u

DEST=~/.liquidprompt

[ ! -d "$DEST" ] && git clone https://github.com/nojhan/liquidprompt.git "$DEST" ||:
cd "$DEST"
git pull

if [[ $(grep -c '. "$DEST"' ~/.bashrc) -eq 0 ]; then
  echo ". \"$DEST\"" >> ~/.bashrc
fi

. ~/.bashrc
