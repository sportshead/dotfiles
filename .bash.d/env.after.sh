if [[ "$OSTYPE" =~ ^darwin ]]; then : ; else
  export PATH="$HOME/.fnm:$PATH"
fi
type fnm >/dev/null 2>&1 && eval "$(fnm env --shell bash --use-on-cd --corepack-enabled)"
type fnm >/dev/null 2>&1 && eval "$(fnm completions --shell bash)"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash

if [[ -s "/etc/debian_version" ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi

