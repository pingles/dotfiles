if [ -f ~/.git-completion ]; then
  source ~/.git-completion
fi

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if [ -f ~/.resty/resty ]; then
  source ~/.resty/resty
fi

export GEM_EDITOR='mate'

# colour terminal and add git branch name
export CLICOLOR=1
export LS_COLORS=exfxcxdxbxegedabagacad
export PS1='\h:\W$(__git_ps1 "(%s)") \u\$ '

export EDITOR="mate -w"

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
 
function authme { 
ssh $1 'cat >>~/.ssh/authorized_keys' <~/.ssh/id_rsa.pub 
}

_mategem()
{
    local curw
    COMPREPLY=()
    curw=${COMP_WORDS[COMP_CWORD]}
    local gems="$(gem environment gemdir)/gems"
    COMPREPLY=($(compgen -W '$(ls $gems)' -- $curw));
    return 0
}
complete -F _mategem -o dirnames mategem

if [[ -s /Users/paul/.rvm/scripts/rvm ]] ; then source /Users/paul/.rvm/scripts/rvm ; fi

export CLASSPATH="/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar:$CLASSPATH"
