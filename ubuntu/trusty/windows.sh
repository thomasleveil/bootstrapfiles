#!/bin/bash
set -e
set -u

## add color support for cygwin term
sed -i 's/xterm-color) color_prompt=yes;;/xterm-color|cygwin) color_prompt=yes;;/' ~/.bashrc
