#: Set Colors with Nord color scheme
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

#: Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'


PROMPT_DIRTRIM=2
PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local exit_code="$?"

    local failed=✗
    local tick=✓
    local arrow=»

    local reset='\[\033[00m\]'

    local red='\[\033[01;31m\]'
    local green='\[\033[01;32m\]'
    local yellow='\[\033[01;33m\]'
    local blue='\[\033[01;34m\]'
    local white='\[\033[01;37m\]'

    local failed_code="[${red}${failed}${blue}]"
    local success_code="[${green}${tick}${blue}]"
    local code=$success_code


    if [ $exit_code != 0 ]; then
        code=$failed_code
    fi

    PS1="${blue}${arrow} ${green}Fra@Psi${blue}╺─${code}─╸${blue}[${reset}\w${blue}]${reset} "

}

export PATH=$PATH:/sbin:/usr/sbin:~/.local/bin

export EDITOR=vim
export VISUAL=vim

bind TAB:menu-complete

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias kdev='KDevelop-5.3.2-x86_64.AppImage &'

alias app='cd /home/frapsi/Software/NumericPlatform/PLAT_USERS/'

alias work='ssh francesco@192.168.9.101'

alias parav='~/Software/Paraview/bin/paraview &'

# Extracts any archive(s) (if unp isn't installed)
extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

fanblast()
{
    sudo fanblast.sh
}

cpu()
{
    local cpuinfo=$'CPU Frequency:\n\n'
    cpuinfo+="$(cat /proc/cpuinfo | grep MHz)"$'\n\n'
    cpuinfo+=$'Temperature:\n\n'
    cpuinfo+="$(sensors | grep "Core\|side")"

    printf "%s\n" "$cpuinfo"
}

batt(){ echo ; upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "energy-full|energy-rate|time to|percentage|capacity"; echo; }

alias watch='watch '

alias l='ls -lah'

export PYTHONDONTWRITEBYTECODE="NeverAgain"

bat(){ echo "##################################";	
       echo -n "# Full Battery Design: " ; cat /sys/class/power_supply/BAT0/charge_full_design | tr '\n' ' '; echo ;
       echo -n  "# Full Battery: " ; cat /sys/class/power_supply/BAT0/charge_full | tr '\n' ' '; echo ;
       echo -n  "# Remaining Battery: " ; cat /sys/class/power_supply/BAT0/charge_now  | tr '\n' ' '; echo ;
       stato=$(cat /sys/class/power_supply/BAT0/status) ;
       if [ "$stato" = "Discharging" ]; then 
	       echo -n  "# Power Drain: " ; cat /sys/class/power_supply/BAT0/current_avg | awk  '{ printf "\033[31m%13s\033[0m mAh #", $1 }' ; echo;
       elif [ "$stato" = "Charging" ]; then 
	       echo -n  "# Power Charge: " ; cat /sys/class/power_supply/BAT0/current_avg | awk  '{ printf "\033[37m%12s\033[0m mAh #", $1 }' ; echo ; 
       fi ;
       echo "##################################"; }

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
#HISTFILESIZE=2000

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
#export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="$PROMPT_COMMAND; history -a"


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
#     xterm-color|*-256color) color_prompt=yes;;
# esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias NumericPlatform='export NUPLAT=/home/frapsi/Software/NumericPlatform && cd $NUPLAT && source plat_conf.sh && cd - '

