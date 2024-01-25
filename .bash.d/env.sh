# shellcheck shell=bash
export EDITOR="nvim"
export VISUAL="$EDITOR"

export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export PROMPT_COMMAND='history -a'
export GPG_TTY=$(tty)

export PATH="$PATH:/usr/local/go/bin"
export PATH="$HOME/go/bin:$PATH"
export GOPATH="$HOME/go"

export PATH="$HOME/.bin:$PATH"

export PATH="$HOME/.yarn/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

export PRETTIERD_DEFAULT_CONFIG="$HOME/.config/.prettierrc"

export PATH="$HOME/.bun/bin:$PATH"

export STORYBOOK_DISABLE_TELEMETRY=1

if [[ "$OSTYPE" =~ ^darwin ]]; then
    export PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"

    export BASH_SILENCE_DEPRECATION_WARNING=1

    if [ "$(arch)" = "arm64" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        export PATH="/opt/homebrew/opt/curl/bin:$PATH"
        [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
        export HOMEBREW_FORCE_BREWED_CURL=1
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi

    if type brew &>/dev/null
    then
      HOMEBREW_PREFIX="$(brew --prefix)"
      if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
      then
        source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
      else
        for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
        do
          [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
        done
      fi
    fi

    export HOMEBREW_CASK_OPTS="--no-quarantine"

    ulimit -S -n 8192

    export SSH_AUTH_SOCK="$HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh"

    export CURL_SSL_BACKEND=secure-transport

    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"

    export XDG_CONFIG_HOME="$HOME/.config"

    export PATH="$PATH:$HOME/.pub-cache/bin"

    export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
    export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
    export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

    export CHROME_EXECUTABLE="/opt/homebrew/bin/chromium"

    source "$(brew --prefix)/share/google-cloud-sdk/path.bash.inc"
    source "$(brew --prefix)/share/google-cloud-sdk/completion.bash.inc"

    export PROXYCHAINS_CONF_FILE="$HOME/.config/proxychains/proxychains.conf"

    export PATH="$(brew --prefix llvm@16)/bin:$PATH"
    export PATH="$HOME/.linkerd2/bin:$PATH"

    export PATH="$(brew --prefix)/anaconda3/bin:$PATH"

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/opt/homebrew/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
fi


if [[ "$OSTYPE" =~ ^darwin ]]; then : ; else
  export PATH="$HOME/.fnm:$PATH"
fi
type fnm >/dev/null 2>&1 && eval "$(fnm env --shell bash --use-on-cd --corepack-enabled)"
type fnm >/dev/null 2>&1 && eval "$(fnm completions --shell bash)"

export NODE_PATH="$NODE_PATH:$(npm root -g)"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash

