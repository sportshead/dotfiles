BASHD="$HOME/.bash.d"
[[ -d "$BASHD" ]] || return 1

for file in $BASHD/{funcs,opts,env,secret-env,aliases,secret-aliases,prompt,iterm2}; do
    [ -r "$file.sh" ] && [ -f "$file.sh" ] && source "$file.sh"
done

unset file
