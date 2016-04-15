#theme
ZSH_THEME="robbyrussell"

#Environment variable
export ZSH=/Users/miuratatsuki/.oh-my-zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/.rbenv/shims:$PATH"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PYENV_ROOT=${HOME}/.pyenv
export LANG=ja_JP.UTF-8
# python setting
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
# Path to your oh-my-zsh installation.
source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(git rails osx bundle brew rails emoji-clock)

# Histroy
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#auto-suggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# alias
alias be="bundle exec"
alias be='bundle exec'
alias rs='rails s'
alias rs4='rails s -p 4000'
alias rs5='rails s -p 5000'
alias rc='rails c'
alias bi='bundle install'
alias sbp='source .bash_profile'
alias ns='npm run start'
alias mys='mysql.server start'
alias mvim="/Applications/MacVim.app/Contents/MacOS/mvim"
alias j="autojump"
if [ -f `brew --prefix`/etc/autojump ]; then
    . `brew --prefix`/etc/autojump
fi

# Completion
autoload -Uz compinit promptinit
compinit
# Complement regardless of upper and lower letters
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# copletion for sudo
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# colors
autoload -Uz colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'


# option
# show Japasene file
setopt print_eight_bit
# treat '#' as comment out 
setopt interactive_comments
# change directory with out cd
setopt auto_cd
# avoid adding same name directory
setopt pushd_ignore_dups
# share history with same zsh tab
setopt share_history
# not to save histroy for same command
setopt hist_ignore_all_dups
# delete unnecessary space for saving history
setopt hist_reduce_blanks

