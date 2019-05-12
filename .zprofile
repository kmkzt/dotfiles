# 補完機能
autoload -U compinit
compinit

# prompt
PROMPT='%m:%c %n$ '

# zshの設定
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
unsetopt promptcr

# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# alias
alias diff="coloddiff"

# Set token
# Github 
ssh-add -K ~/.ssh/github

~/setToken.sh