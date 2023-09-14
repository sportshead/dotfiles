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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if [[ "$OSTYPE" =~ ^darwin ]]; then
    export PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"

    export BASH_SILENCE_DEPRECATION_WARNING=1

    eval "$(/opt/homebrew/bin/brew shellenv)"
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

    export PATH="/opt/homebrew/opt/curl/bin:$PATH"
    [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

    ulimit -S -n 8192

    export SSH_AUTH_SOCK="$HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh"

    export HOMEBREW_FORCE_BREWED_CURL=1
    export CURL_SSL_BACKEND=secure-transport

    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"

    export XDG_CONFIG_HOME="$HOME/.config"
fi

