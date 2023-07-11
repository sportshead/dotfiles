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

    export PATH="/opt/homebrew/opt/curl/bin:$PATH"
    [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

    ulimit -S -n 8192

    export SSH_AUTH_SOCK="$HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh"
fi

