# for russian in iterm
export LC_CTYPE="UTF-8"
# # for quandry (qw)
export EDITOR="vim"
export GIT_EDITOR="vim"
export SVN_EDITOR="vim"

export ACKRC="~/.ackrc"

# # git aliases
alias gst='git status -sb'
# alias ga='git add'
alias gc='git commit -m'
# alias gp='git pull && git push'
alias gull='git pull'
alias gush='git push'
# alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
# alias gdw='git diff --word-diff'
# alias gm='git merge -m'

source ~/.ssh_aliases


export DISABLE_AUTO_TITLE=true

# # RVM
# [[ -s "/Users/trybeee/.rvm/scripts/rvm" ]] && source "/Users/trybeee/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# time
export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

# scheme with history support, auto-completion etc
alias scheme="rlwrap -r -c -f \"$HOME\"/Code/scheme_completion.txt scheme"
alias clj="rlwrap clj"

alias sml="rlwrap sml"

# load ssh-agent
ssh-add ~/.ssh/id_rsa
ssh-add ~/.ssh/virool_id_rsa

export TERM="xterm-256color"

export SSL_CERT_FILE="/usr/local/etc/openssl/certs/cert.pem"

alias gh="open \`git remote -v | grep git@github.com | grep fetch | head -1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/http:\/\//'\`"

alias iphone="open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"

alias jmc="/Library/Java/JavaVirtualMachines/jdk1.8.0_20.jdk/Contents/Home/bin/jmc"

# rbenv
eval "$(rbenv init -)"

export PATH=~/SDKs/PebbleSDK-2.0.0/bin/:$PATH


# virool-workers set up
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_20.jdk/Contents/Home"
export KAFKA_CONFIG="/usr/local/etc/kafka"

alias docker-sh="/Applications/Docker/Docker\ Quickstart\ Terminal.app/Contents/Resources/Scripts/start.sh"

alias lockscreen='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'


function psql2 {
  psql -p 6432 -U `cat ~/.pgpass | grep $1 | cut -d: -f4` -h `cat ~/.pgpass | grep $1 | cut -d: -f1` $2
}

export GOPATH=/Users/trybeee/go
export PATH=$GOPATH/bin:$PATH

source ~/.wakatime.apikey
