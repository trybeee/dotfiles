# enables VI mode in bash
# set -o vi


export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:~/bin:$PATH"
export RUBYOPT=rubygems
export CAPP_BUILD="/Users/trybeee/Code/cappuccino_build"
export GIT_EDITOR="/usr/local/bin/subl"
export SVN_EDITOR="/usr/local/bin/subl"
# export AUTOFEATURE=true autotest
export MANPATH=/opt/local/share/man:$MANPATH
export EC2_HOME=/Users/trybeee/.ec2
export PATH=$PATH:$EC2_HOME/bin
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

source ~/.ssh_aliases

#git aliases
alias gst='git status -sb'
alias ga='git add'
alias gc='git commit -m'
alias gp='git pull && git push'
alias gull='git pull'
alias gush='git push'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gdw='git diff --word-diff'
alias gm='git merge -m'

#run javascript rhino engine
alias js='java org.mozilla.javascript.tools.shell.Main'


#rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
if [[ -s /Users/trybeee/.rvm/scripts/rvm ]] ; then source /Users/trybeee/.rvm/scripts/rvm ; fi

source ~/.git-completion.bash
export GIT_PS1_SHOWDIRTYSTATE=true # '*' for unstaged changes, '+' for staged
export GIT_PS1_SHOWSTASHSTATE=true # '$' if smth is stashed
export GIT_PS1_SHOWUNTRACKEDFILES=true # '%' if un-tracked files

# rvm and ps1
function rvm_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local ruby_version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  [ "$ruby_version" != "" ] && ruby_version="$ruby_version"
  local full="$ruby_version$gemset"
  [ "$full" != "" ] && echo "$full "
}

export PS1='\[\033[1;33m\]\w\[\033[0m\] \[\033[3;31m\]$(rvm_version)\[\033[0;32m\]$(__git_ps1 "(%s)") \[\033[0m\]$ '

# for russian in iterm
export LC_CTYPE="UTF-8"

# for quandry (qw)
export EDITOR="vim"

[[ -s "/Users/trybeee/.rvm/scripts/rvm" ]] && source "/Users/trybeee/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/trybeee/.sdkman"
[[ -s "/Users/trybeee/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/trybeee/.sdkman/bin/sdkman-init.sh"
fi

export GOPATH=/Users/trybeee/go
export PATH=$GOPATH/bin:$PATH

# export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
export JAVA_HOME="$(jenv prefix)"
alias jenv_set_java_home='export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"'
