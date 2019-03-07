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

# ssh
alias sk='ssh-add -K'

# Git command
alias gbr='git branch'
alias gch='git checkout'
alias gbc='git checkout $(git branch -a --sort=-authordate | cut -b 3- | grep -v -- "->" | peco | sed -e "s%remotes/origin/%%")'
alias gfa='git fetch -a'
alias gpsh='git push origin `git rev-parse --abbrev-ref HEAD`'
alias gpll='git pull origin `git rev-parse --abbrev-ref HEAD` --rebase'
alias grb='git rebase'
alias glog='git log --pretty=short --graph'
alias grs='git reset --soft HEAD^'
alias gst='git status'
alias gg='git grep'
alias gclear='git branch --merged | grep -v "*" | xargs -I % git branch -d %'
alias gdfn='git diff HEAD..HEAD^ --name-only'
# フォーク元の設定・更新系のコマンド
alias grafm=`git remote add fork_master`
alias gfefm=`git fetch fork_master`

# fork元を操作するコマンド
alias gaup='git remote add upstream'
alias gfup='git fetch upstream'
alias gmup='git merge upstream/master'

# 隠しファイル表示切り替え
alias vifile='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder'
alias hifile='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder'

# ポートデバッグ
alias findport='lsof -i -P | grep '
alias killport='kill -9 '

# docker command
alias dcclear='docker rm -f $(docker ps -aq)' # dockerのコンテナを一括削除

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

