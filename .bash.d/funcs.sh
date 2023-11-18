_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
#                cat ~/.ssh/config | \
#                        grep "^Host " | \
#                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
if [[ "$OSTYPE" =~ ^darwin ]]; then
    complete -F _complete_ssh_hosts ssh
    complete -F _complete_ssh_hosts scp
    complete -F _complete_ssh_hosts ping
fi

test_term_colors()
{
awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
}'
}

mk() {
  mkdir -p "$@" && cd "$@"
}

if [[ "$OSTYPE" =~ ^darwin ]]; then
    # Change working directory to the top-most Finder window location
    function cdf() {
    	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
    }

    # https://scriptingosx.com/2022/11/on-viewing-man-pages-ventura-update/
    manpdf() {
        mandoc -T pdf "$(/usr/bin/man -w $@)" | open -fa Preview
    }

    gptk(){ WINEESYNC=1 WINEPREFIX=~/wine-virt $(brew --prefix game-porting-toolkit)/bin/wine64 "$@"; }
    alias gptk-steam="gptk 'C:\Program Files (x86)\Steam\steam.exe'"
fi
