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

alias n="nvim ."

if [[ "$OSTYPE" =~ ^darwin ]]; then
	alias bri="brew install"
	alias brc="brew install --cask"

	alias zip="zip -x *.DS_Store -x *__MACOSX* -x *.AppleDouble*"
	alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"

	alias firefox="/Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox"
	alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"

	alias git="hub"

	alias kill-wine="killall -9 wineserver && killall -9 wine64-preloader"

	alias signal="nohup /Applications/Signal.app/Contents/MacOS/Signal </dev/null >/dev/null 2>&1 & disown"

	alias proxy="export http_proxy=http://127.0.0.1:1087;export https_proxy=http://127.0.0.1:1087;export ALL_PROXY=socks5://127.0.0.1:1080;export NO_PROXY=\"localhost,127.0.0.1\""
	alias unproxy="unset http_proxy;unset https_proxy;unset ALL_PROXY;unset NO_PROXY"
fi
