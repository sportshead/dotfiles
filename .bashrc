BASHD="$HOME/.bash.d"
[[ -d "$BASHD" ]] || return 1

for file in $BASHD/{funcs,opts,env,env.mac,env.after,secret-env,aliases,secret-aliases,prompt}; do
	[ -r "$file.sh" ] && [ -f "$file.sh" ] && source "$file.sh"
done

if [[ "$LC_TERMINAL" =~ "iterm2" ]]; then
	[ -r "$file.sh" ] && [ -f "$file.sh" ] && source "$BASHD/iterm2.sh"
fi

unset file
