BASHD="$HOME/.bash.d"
[[ -d "$BASHD" ]] || return 1

for file in $BASHD/{env,aliases,prompt}; do
    [ -r "$file.sh" ] && [ -f "$file.sh" ] && source "$file.sh"
done


unset file

