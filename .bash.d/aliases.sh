alias ls="ls --color=auto -p"

alias ldir="exa -la -d */"
alias ll="exa -lag"
alias llg="exa -la | grep"
alias lag="exa -la --git"

alias lg="lazygit"
alias tsx="yarn dlx --quiet @sportshead/tsx-component"

alias bashe="$EDITOR ~/.bash_profile"
alias src=". ~/.bash_profile"

alias clr="clear"

alias grep='grep --color=auto'
alias findf="find . -type f -iname "
alias findd="find . -type d -iname "
alias psg="ps aux | grep -i "

if [[ "$OSTYPE" =~ ^darwin ]]; then
    alias bri="brew install"
    alias brc="brew install --cask"

    alias zip="zip -x *.DS_Store -x *__MACOSX* -x *.AppleDouble*"
    alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"

    alias firefox="/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox"
    alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"
fi