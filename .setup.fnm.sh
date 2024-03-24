#!/bin/bash

if [[ "$OSTYPE" =~ ^darwin ]]; then : ; else
  mkdir -p "$HOME/.fnm"
fi
curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "./.fnm" --skip-shell

eval "$(fnm env --shell bash --use-on-cd --corepack-enabled)"

fnm install 21
fnm use 21
fnm default 21
