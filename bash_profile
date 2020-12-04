# .bash_profile

BASE16_SHELL=$HOME/dotfiles/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Import machine specific profile configuration.
if [ -f ~/.local_bash_profile ]; then
	. ~/.local_bash_profile
fi

# Requires `sudo dnf install xorg-x11-drv-wacom`
function wacom() {
    xsetwacom set "Wacom Intuos PT S 2 Pen stylus" MapToOutput DVI-1
}

# used to refresh ssh connection for tmux
# http://justinchouinard.com/blog/2010/04/10/fix-stale-ssh-environment-variables-in-gnu-screen-and-tmux/
function r() {
  if [[ -n $TMUX ]]; then
    NEW_SSH_AUTH_SOCK=`tmux showenv|grep ^SSH_AUTH_SOCK|cut -d = -f 2`
    if [[ -n $NEW_SSH_AUTH_SOCK ]] && [[ -S $NEW_SSH_AUTH_SOCK ]]; then
      SSH_AUTH_SOCK=$NEW_SSH_AUTH_SOCK
    fi
    DISPLAY=`tmux showenv | grep DISPLAY | cut -d'=' -f2`
  fi
}

# Function to get the branch name of current git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

get_conda_env_name() {
    env | grep CONDA_DEFAULT_ENV | sed 's/CONDA_DEFAULT_ENV=//'
}
# Set shell prompt to list current git branch
PS1="╭─[(\$(get_conda_env_name)) \d \t \W \u@\h \[$(tput bold)\]\[$(tput setaf 4)\]\W\[$(tput setaf 2)\]\$(parse_git_branch)\[$(tput sgr0)\]]\n╰─\$ "

# User specific environment and startup programs
# For personally compiled binaries
PATH=$PATH:$HOME/bin

export PATH

# I use vi instead of emacs shortcuts for bash readline
set -o vi

# Try and make the listing colours more readable
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:';

# Default to using vim as text editor
export EDITOR=vim

# Import mac specific profile configuration.
if [ -f ~/.profile ]; then
	. ~/.profile
fi

alias such=git
alias very=git
alias much=git
alias wow='git status'

alias ?='git status'

# https://mastodon.social/@LottieVixen/8499030
alias boop="touch"

if command -v exa >/dev/null 2>&1; then
    alias ll="exa -l --git"
else
    alias ll="ls -lGh"
fi

export GPG_TTY=$(tty)

git-branch-deleted-merged () {
    git branch --merged | grep -vw master
    echo -n "Delete branches [Y/n]? "
    read answer
    case $answer in
            ([Yy]* | "") git branch --merged | grep -vw master | xargs git branch -d ;;
            (*) return ;;
    esac
}

export EDITOR=nvim

export PATH="$HOME/go/bin:$PATH"
