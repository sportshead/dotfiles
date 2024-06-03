BASHD="$HOME/.bash.d"
[[ -d "$BASHD" ]] || return 1

for file in $BASHD/{funcs,opts,env,env.mac,env.after,secret-env,aliases,secret-aliases,prompt}; do
	[ -r "$file.sh" ] && [ -f "$file.sh" ] && source "$file.sh"
done

if [[ "$LC_TERMINAL" =~ "iTerm2" ]]; then
	[ -r "$BASHD/iterm2.sh" ] && [ -f "$BASHD/iterm2.sh" ] && source "$BASHD/iterm2.sh"
fi

unset file
