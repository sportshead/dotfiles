# shellcheck shell=bash
export EDITOR="nvim"
export VISUAL="$EDITOR"

export LC_ALL="en_GB.UTF-8"
export TERM="xterm-256color"
export PROMPT_COMMAND="history -a"
export GPG_TTY="$(tty)"

export PATH="$PATH:/usr/local/go/bin"
export PATH="$HOME/go/bin:$PATH"
export GOPATH="$HOME/go"

export PATH="$HOME/.bin:$PATH"

export PATH="$HOME/.yarn/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

export PRETTIERD_DEFAULT_CONFIG="$HOME/.config/.prettierrc"

export PATH="$HOME/.bun/bin:$PATH"

export STORYBOOK_DISABLE_TELEMETRY=1

export XDG_CONFIG_HOME="$HOME/.config"
