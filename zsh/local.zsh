export EDITOR='emacs'
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=50000
export LSCOLORS='exFxCxdxBxegedabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export PAGER='less'
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
zstyle ':chpwd:*' recent-dirs-file "${HOME}/.zsh/chpwd-recent-dirs" +
zstyle ':chpwd:*' recent-dirs-max 400

# smart-insert-last-word
autoload -Uz smart-insert-last-word
zle -N insert-last-word smart-insert-last-word

# zinit
declare -A ZINIT
ZINIT[HOME_DIR]="${HOME}/.zsh/zinit"
ZINIT[ZCOMPDUMP_PATH]="${HOME}/.zsh/zcompdump"
ZINIT[COMPINIT_OPTS]='-u'
source "${HOME}/.zsh/zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# fasd
export _FASD_DATA="${HOME}/.zsh/fasd"
zinit ice pick'fasd'
zinit light 'clvv/fasd'
eval "$(fasd --init auto)"

# git
zinit snippet 'OMZ::lib/git.zsh'
zinit snippet 'OMZ::plugins/git/git.plugin.zsh'

# gitignore
zinit snippet 'OMZ::plugins/gitignore/gitignore.plugin.zsh'

# zsh-grc
grc_options_df='-h'
grc_options_du='-h'
grc_options_ls='-CF'
zinit ice src'grc.zsh'
zinit light 'mahori/zsh-grc'

# solarized-powerline
setopt promptsubst
export SP_DISABLE_VIRTUAL_ENV_PROMPT='true'
export SP_DISABLE_VI_INDICATOR='true'
zinit light 'houjunchen/solarized-powerline'

# zaw
zinit light 'zsh-users/zaw'
bindkey '^X^A' zaw-fasd
bindkey '^X^D' zaw-fasd-directories
bindkey '^X^F' zaw-fasd-files
bindkey '^X^H' zaw-history
bindkey '^X^E^R' zaw-cdr
bindkey '^X^E^S' zaw-ssh-hosts
bindkey '^X^E^T' zaw-tmux

# zsh-autosuggestions
zinit light 'zsh-users/zsh-autosuggestions'

# zsh-completions
zinit light 'zsh-users/zsh-completions'

# zsh-syntax-highlighting
zinit light 'zsh-users/zsh-syntax-highlighting'

# zsh-history-substring-search
#   https://github.com/zsh-users/zsh-history-substring-search#usage
#   によりzsh-syntax-highlightingを先にロード
zinit light 'zsh-users/zsh-history-substring-search'
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

autoload -Uz compinit
compinit -u -d "${HOME}/.zsh/zcompdump"
