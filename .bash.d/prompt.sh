# colors
GREEN="\033[38;5;10m"
RED="\033[38;5;9m"
BLUE="\033[01;34m"

RESET=$(tput sgr0)

__usercolor() {
    if [[ $UID = 0 ]]; then
        printf "$RED"
    else
        printf "$GREEN"
    fi
}
PS1="\$(__usercolor)"
PS1+="\u"
PS1+="$RESET$GREEN"
PS1+="@\h"
PS1+="$RESET"
PS1+=":"
PS1+="$BLUE"
PS1+="\w"
PS1+="$RESET$RED"
PS1+="\\$"
PS1+="$RESET "
export PS1

