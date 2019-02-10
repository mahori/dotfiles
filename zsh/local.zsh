export HISTFILE="${HOME}/.zsh/history"
export HISTSIZE=50000
export LSCOLORS=exFxCxdxBxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export PAGER=less
export SAVEHIST=50000

autoload -Uz colors
colors

setopt auto_pushd
setopt complete_aliases
setopt correct
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt ignore_eof
setopt no_list_beep
setopt list_packed
setopt pushd_ignore_dups
setopt share_history

stty start undef
stty stop undef

alias cp='cp -i'
alias less='less -RX'
alias mv='mv -i'
alias rm='rm -i'
alias su='su -l'
alias tmux='tmux -2'
alias where='command -v'

zstyle ':completion:*' format '%BCompleting %d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-file ${HOME}/.zsh/chpwd-recent-dirs +
zstyle ':chpwd:*' recent-dirs-max 400

# smart-insert-last-word
autoload -Uz smart-insert-last-word
zle -N insert-last-word smart-insert-last-word

# zplug
export ZPLUG_HOME="${HOME}/.zsh/zplug"
if [ ! -d ${ZPLUG_HOME}/repos/zplug/zplug ]
then
    mkdir -p ${ZPLUG_HOME}/repos/zplug/zplug
    git clone https://github.com/zplug/zplug ${ZPLUG_HOME}/repos/zplug/zplug
fi
source ${ZPLUG_HOME}/repos/zplug/zplug/init.zsh
export PATH="${ZPLUG_BIN}:${PATH}"

# fasd
export _FASD_DATA="${HOME}/.zsh/fasd"
zplug "clvv/fasd", as:command, use:fasd
eval "$(fasd --init auto)"

# git
zplug "plugins/git", from:oh-my-zsh

# gitignore
zplug "plugins/gitignore", from:oh-my-zsh

# zsh-grc
grc_options_df='-h'
grc_options_du='-h'
grc_options_ls='-CFw'
zplug "mahori/zsh-grc", use:grc.zsh

# theme
if [ -n "${INSIDE_EMACS}" ]
then
    # rawsyntax
    zplug "rawsyntax/7310990", from:gist, as:theme
else
    # solarized-powerline
    export SP_DISABLE_VIRTUAL_ENV_PROMPT='true'
    export SP_DISABLE_VI_INDICATOR='true'
    zplug "houjunchen/solarized-powerline", as:theme
fi

# zaw
zplug "zsh-users/zaw"
bindkey '^X^A' zaw-fasd
bindkey '^X^D' zaw-fasd-directories
bindkey '^X^F' zaw-fasd-files
bindkey '^X^H' zaw-history
bindkey '^X^E^R' zaw-cdr
bindkey '^X^E^S' zaw-ssh-hosts
bindkey '^X^E^T' zaw-tmux

# zsh-autosuggestions
zplug "zsh-users/zsh-autosuggestions"

# zsh-completions
zplug "zsh-users/zsh-completions"

# zsh-syntax-highlighting
zplug "zsh-users/zsh-syntax-highlighting"

# zsh-history-substring-search
#   https://github.com/zsh-users/zsh-history-substring-search#usage
#   によりzsh-syntax-highlightingを先にロード
zplug "zsh-users/zsh-history-substring-search"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# zplug
zplug "zplug/zplug", hook-build:'zplug --self-manage'

if ! zplug check
then
    zplug install
fi

zplug load
