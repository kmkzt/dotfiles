# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Ruby
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

# Python
export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init -)"

# Node
if [[ -s ~/.nvm/nvm.sh ]];
 then source ~/.nvm/nvm.sh
 npm config delete prefix
fi

unsetopt promptcr

# Git commnad
alias gbr='git branch'
alias gch='git checkout'
alias gfa='git fetch -a'
alias gpsh='git push origin `git rev-parse --abbrev-ref HEAD`'
alias gpll='git pull origin `git rev-parse --abbrev-ref HEAD`'
alias grb='git rebase origin '
alias glog='git log --pretty=short --graph'
alias grs='git reset --soft HEAD^'
alias gst='git status'
alias gg='git grep'

# peco
function peco-src() {
    local src=$(ghq list --full-path | peco --query "$BUFFER")
    if [ -n "$src" ]; then
        BUFFER="cd $src"
        zle accept-line
    fi 
    zle -R -c
}
zle -N peco-src
bindkey '^]' peco-src

