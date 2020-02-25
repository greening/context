
# Script order: /etc/zshenv ~/.zshenv [login: /etc/zprofile ~/.zprofile]
#           [interactive: /etc/zshrc ~/.zshrc] [login: /etc/zlogin ~/.zlogin]

# Reset variables to original system settings

PATH=${ORIG_PATH=${PATH##${HOME}/bin:}}
MANPATH=${ORIG_MANPATH=${MANPATH}}
INFOPATH=${ORIG_INFOPATH=${INFOPATH}}
LD_LIBRARY_PATH=${ORIG_LD_LIBRARY_PATH=${LD_LIBRARY_PATH}}
export ORIG_PATH ORIG_MANPATH ORIG_INFOPATH ORIG_LD_LIBRARY_PATH

# Personal settings

# Operating system specific settings
# These settings assume I've set /etc/profile PATHS for local software 
# (/usr/local, /opt/local, etc.)

export SYSTEM=`uname -s`
if [ $SYSTEM = "Darwin" ] ; then
    export PATH=/usr/local/git/bin:/usr/local/mysql/bin:/opt/local/bin:/usr/X11R6/bin:/usr/local/bin:$PATH
    export MANPATH=/opt/local/man:/usr/X11R6/man:/usr/local/man:$MANPATH
    export INFOPATH=/opt/local/share/info:/sw/share/info:/usr/local/share/info:$INFOPATH
    export LD_LIBRARY_PATH=/usr/local/lib${LD_LIBRARY_PATH:+:}${LD_LIBRARY_PATH}
    if [ "$JAVA_VERSION" = "" ] ; then
        export JAVA_VERSION=13
        fi
    export JAVA_HOME=`/usr/libexec/java_home -v ${JAVA_VERSION}`
    export TOMCAT_HOME=/Library/Tomcat
    export M2_HOME=/usr/local/share/maven
    export M2=${M2_HOME}/bin
    export MAVEN_OPTS="-Xms256m -Xmx512m"
    export ORACLE_OWNER=greening
    export ORACLE_HOME=/Users/greening/oracle/product/10.2.0/db_1
    export TNS_ADMIN=${ORACLE_HOME}\network\admin
    export DYLD_LIBRARY_PATH=${ORACLE_HOME}/lib
    export SCALA_HOME=/usr/local/share/scala
    export HASKELL_HOME="${HOME}/Library/Haskell"
    export TEX_HOME="/usr/local/texlive/2012/bin/x86_64-darwin"
    export RVM_HOME="${HOME}/.rvm"
  elif [ $SYSTEM = "Linux" ] ; then
    export PATH=${PATH}:/opt/gnome/bin:/opt/kde3/bin:/sbin:/usr/sbin
    fi

# Host specific settings

if [ ${+JAVA_HOME} ] ; then 
    if [[ -d ${JAVA_HOME}/bin ]]
        then export PATH=${JAVA_HOME}/bin:${PATH} ; fi
    if [[ -d ${JAVA_HOME}/man ]] 
        then export MANPATH=${JAVA_HOME}/man:${MANPATH} ; fi
    fi
if [ ${+ORACLE_HOME} ] ; then
    export PATH=${ORACLE_HOME}/bin:${PATH}
    export LD_LIBRARY_PATH=${ORACLE_HOME}/lib${LD_LIBRARY_PATH:+:}${LD_LIBRARY_PATH}
    fi
if [[ (${+ANT_HOME} -eq 0) && -d /usr/local/ant ]] ; then
    export ANT_HOME=/usr/local/ant 
  elif [[ (${+ANT_HOME} -eq 1) && -d ${ANT_HOME}/bin ]] ; then
    export PATH=$ANT_HOME/bin:$PATH ; fi
if [ ${+M2_HOME} ] ; then export PATH=${M2_HOME}/bin:${PATH} ; fi
if [ ${+RVM_HOME} ] ; then export PATH=${RVM_HOME}/bin:${PATH} ; fi
if [ ${+SCALA_HOME} ] ; then export PATH=${SCALA_HOME}/bin:${PATH} ; fi
if [ ${+M2_HOME} ] ; then export PATH=${M2_HOME}/bin:${PATH} ; fi
if [ ${+HASKELL_HOME} ] ; then export PATH="${HASKELL_HOME}/bin:$PATH" ; fi
if [ ${+TEX_HOME} ] ; then export PATH="${TEX_HOME}:$PATH" ; fi

# Finally put user bin directory first.

if [[ -d $HOME/bin ]] ; then PATH=$HOME/bin:$PATH ; fi
