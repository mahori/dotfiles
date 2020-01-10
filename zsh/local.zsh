export EDITOR='emacs'
export HISTFILE="${HOME}/.zsh/history"
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

# zplugin
export ZPLG_HOME="${HOME}/.zsh/zplugin"
if [[ ! -d "${ZPLG_HOME}" ]]
then
    export ZDOTDIR=$(mktemp -d -t 'zplugin.XXXXXXXXXX')
    touch ${ZDOTDIR}/.zshrc
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
    rm -rf ${ZDOTDIR}
    unset ZDOTDIR
fi

declare -A ZPLGM
ZPLGM[HOME_DIR]="${ZPLG_HOME}"
source "${HOME}/.zsh/zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
unset ZPLG_HOME

# fasd
export _FASD_DATA="${HOME}/.zsh/fasd"
zplugin ice pick'fasd'
zplugin light 'clvv/fasd'
eval "$(fasd --init auto)"

# git
zplugin snippet 'OMZ::lib/git.zsh'
zplugin snippet 'OMZ::plugins/git/git.plugin.zsh'

# gitignore
zplugin snippet 'OMZ::plugins/gitignore/gitignore.plugin.zsh'

# zsh-grc
grc_options_df='-h'
grc_options_du='-h'
grc_options_ls='-CF'
zplugin ice src'grc.zsh'
zplugin light 'mahori/zsh-grc'

# solarized-powerline
setopt promptsubst
export SP_DISABLE_VIRTUAL_ENV_PROMPT='true'
export SP_DISABLE_VI_INDICATOR='true'
zplugin light 'houjunchen/solarized-powerline'

# zaw
zplugin light 'zsh-users/zaw'
bindkey '^X^A' zaw-fasd
bindkey '^X^D' zaw-fasd-directories
bindkey '^X^F' zaw-fasd-files
bindkey '^X^H' zaw-history
bindkey '^X^E^R' zaw-cdr
bindkey '^X^E^S' zaw-ssh-hosts
bindkey '^X^E^T' zaw-tmux

# zsh-autosuggestions
zplugin light 'zsh-users/zsh-autosuggestions'

# zsh-completions
zplugin light 'zsh-users/zsh-completions'

# zsh-syntax-highlighting
zplugin light 'zsh-users/zsh-syntax-highlighting'

# zsh-history-substring-search
#   https://github.com/zsh-users/zsh-history-substring-search#usage
#   によりzsh-syntax-highlightingを先にロード
zplugin light 'zsh-users/zsh-history-substring-search'
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

autoload -Uz compinit
compinit -u -d "${HOME}/.zsh/zcompdump"
