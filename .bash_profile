# export PATH="/opt/homebrew/opt/moreutils/bin:$PATH"
# exec 5> >(ts -i "%.s" >> /tmp/timestamps)
# export BASH_XTRACEFD="5"
# set -x

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
test -f ~/.bashrc && source ~/.bashrc

# set +x

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.bash 2>/dev/null || :
