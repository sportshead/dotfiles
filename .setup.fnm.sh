#!/bin/bash
if [[ "$OSTYPE" =~ ^darwin ]]; then
    brew install fnm
else
    curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
fi

eval "$(fnm env --shell bash --use-on-cd --corepack-enabled)"

fnm install 21
fnm use 21
fnm default 21
