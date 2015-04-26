# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bburton"
#ZSH_THEME="duellj"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby rvm knife)

source $ZSH/oh-my-zsh.sh

# User configuration

#export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# dat path
export PATH="$HOME/bin:/usr/local/bin:$HOME/code/lookout/keyringer:$HOME/.rvm/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin/bin
export GOPATH=/usr/local/opt/go/libexec/bin

export GITHUB_TOKEN=8adbd8bb5898d86f9a19ea50143cff0ebcfd3a45

## ALIASES ##
alias ssh="ssh -A"
alias s="sudo"
alias be="bundle exec"
alias gemr="gem uninstall"
alias gemi="gem install"
alias mutt='cd ~/Desktop && mutt'
alias kitchen='be kitchen'
alias gist='gist -p -s -c'
alias ssh-nuke-key='ssh-keygen -R'

## emacs related
alias emacsclient="$HOME/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias emacs="ec"
alias e="emacs"


# fancy editor settings
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='vim'
fi

# for AAM
source $HOME/bin/aam
#source /usr/local/share/zsh/site-functions/_aws
export AWS_X509_CERT="/Users/bburton/.aws/brandon.burton_lookout_aws.pem.crt"
export AWS_X509_KEY="/Users/bburton/.aws/brandon.burton_lookout_aws.pem.key"
export AWS_ACCOUNT_ID="7426-3046-2602"
export AWS_SSH_KEY_ID="id_rsa_bburton_lookout_com"
export KITCHEN_SSH_KEY="$HOME/.ssh/id_rsa_bburton_lookout_com"
export KITCHEN_SYNC_MODE=sftp
# for autoenv
source /usr/local/opt/autoenv/activate.sh
source ~/.chef/kitchen-env.sh

# test-kitchen related aliases
alias crt="scripts/pre-commit"
alias kdkc="kitchen destroy && kitchen create"
alias kcv="kitchen converge"

eval "$(dvm env)"

_wormhole_opening_command='ssh -Nf wormhole'
wormhole_open() {
  eval $_wormhole_opening_command
}
wormhole_collapse() {
  pkill -f "$_wormhole_opening_command"
}
wormhole_ssh() {
  ssh -o "ProxyCommand ssh -W %h:%p wormhole" $*
}

alias wsshe="wormhole_ssh 10.10.2.198"
alias ssh="ssh -A"
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'

setopt noflowcontrol
