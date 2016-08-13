
# Script order: /etc/zshenv ~/.zshenv [login: /etc/zprofile ~/.zprofile]
#           [interactive: /etc/zshrc ~/.zshrc] [login: /etc/zlogin ~/.zlogin]

export LESS=-X
if [[ "$TERM" == "xterm" ]] ; then export XTERM=xterm-color; fi

source ~/share/git-completion.bash
source ~/share/git-prompt.sh

case "$TERM" in
  *xterm*|rxvt*|gnome-terminal|*onsole|zvt|(dt|k|E|z)term)
    export PS1="%U%n %2. $(__git_ps1 '%s')%u %{]2;%n %m %2.%}"
#        ZSH:  setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
    ;;
  *)
    export PS1="%U%n %2. $(__git_ps1 '%s')%u "
    ;;
  esac

# Directory shortcuts
export t=$HOME/dev/tpg/tpg-code

alias ls='ls -CF'
set -o AUTO_LIST 
set -o CLOBBER 
set -o LIST_AMBIGUOUS 
set -o LIST_BEEP 
set -o PROMPT_PERCENT
set -o IGNORE_EOF
set -o sharehistory
set -o histsavenodups
set -o histignorealldups 
set -o histverify
export HISTFILE=~/.zhistory 
export HISTSIZE=500 
export SAVEHIST=500
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

