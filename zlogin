
# Script order: /etc/zshenv ~/.zshenv [login: /etc/zprofile ~/.zprofile]
#           [interactive: /etc/zshrc ~/.zshrc] [login: /etc/zlogin ~/.zlogin]

if [ $TERM = 'xterm-color' ] ; then export TERM=xterm ; fi
export SAVEHIST=10000
export APPEND_HIST=1
