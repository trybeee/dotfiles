DISABLE_CORRECTION="true"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="crunch"
#ZSH_THEME="dallas"
#
# ZSH_THEME="geoffgarside"
# ZSH_THEME="af-magic"
# ZSH_THEME="lambda"
# ZSH_THEME="superjarin"

# ZSH_THEME="dieter"
ZSH_THEME="ys"
#ZSH_THEME="tjkirch"

# **********************
### iterm2 theme
# base 16 monokai light
# **********************

# ZSH_THEME="flazz"

# ZSH_THEME="macovsky-ruby"

# ZSH_THEME="kphoen"
# ZSH_THEME="norm"
# ZSH_THEME="zhann"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler brew git github gem osx rails ruby rvm sublime vim)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Users/trybeee/.rvm/bin:/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/local/mysql/bin:~/bin:/Users/trybeee/.ec2/bin:/Users/trybeee/.ec2/bin

source ~/.zprofile

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

it2prof() { echo -e "\033]50;SetProfile=$1\a" }

start_boot2docker() {
  boot2docker ip 2>/dev/null >/dev/null || boot2docker up
  export_boot2docker
}

export_boot2docker() {
  $(boot2docker shellinit 2>/dev/null)
}
export_boot2docker
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

psql2 () {
  psql -U `cat ~/.pgpass | grep $1 | cut -d: -f4` -h `cat ~/.pgpass | grep $1 | cut -d: -f1` $2
}

# source /Users/trybeee/.iterm2_shell_integration.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/trybeee/.sdkman"
[[ -s "/Users/trybeee/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/trybeee/.sdkman/bin/sdkman-init.sh"

echo "\n\n** Be Present **\n\n"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# docker login
# docker pull virool/virool:master
alias virool_docker="docker run -it -v $(pwd)/.git:/virool/app/.git -v $(pwd)/.gitignore:/virool/app/.gitignore -v ~/.ssh/id_rsa:/root/.ssh/id_rsa --entrypoint bash virool/virool:master"

function _kube_pod() {
  kubectl get pods | grep $1 | cut -d" " -f 1 | head -n 1
}

function kuberails() {
    kubectl exec -ti $(_kube_pod virool-web) -c virool-web -- bundle exec rails c production
}

function kubeto() {
#context=$(echo $1 | tr '[:lower:]' '[:upper:]')
  cont=$(kubectl --context=$context get pods | grep $1 | cut -d" " -f 1 | head -n 1)
  kubectl --context=$context exec -ti $cont --container $2 bash
}

function kubelogs() {
    kubeto $1 logs
}

function kubeapp() {
    kubeto $1 $1
}


export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
alias jenv_set_java_home='export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"'
export PATH="/usr/local/opt/qt/bin:$PATH"

source ~/.zprofile

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
