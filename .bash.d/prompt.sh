# colors
GREEN="\001\033[38;5;10m\002"
RED="\001\033[38;5;9m\002"
BLUE="\001\033[01;34m\002"

RESET="\001$(tput sgr0)\002"

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

