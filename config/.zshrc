# zshの設定
# 補完機能
autoload -U compinit
compinit
# prompt
# PROMPT='%~:%n$ '
PROMPT='%~:$ '

# history
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
unsetopt promptcr
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
setopt nonomatch # escapt `no matches found.` 

# any env
export PATH=$HOME/.anyenv/bin:$PATH
eval "$(anyenv init -)"

# node
export PATH=$HOME/.anyenv/envs/nodenv/bin:$PATH
eval "$(nodenv init -)"

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Ruby
export PATH=$HOME/.rbenv/shims:$PATH
if [[ -x `which rbenv` ]]; then
    eval "$(rbenv init -)"
fi

# Gem
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# Python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

if [[ -x `which pyenv` ]]; then
    eval "$(pyenv init -)"
fi

# Rust
source ~/.cargo/env
# export PATH=$HOME/.cargo/bin:$PATH

# Flutter
# Docs -> https://flutter.dev/docs/get-started/install/macos
PATH_OF_FLUTTER_GIT_DIRECTORY=$GOPATH/src/github.com/flutter/flutter
export PATH=$PATH:$PATH_OF_FLUTTER_GIT_DIRECTORY/bin

# Dart 
# PUB: Dart Package Manager -> https://dart.dev/tools/pub/cmd/pub-global#running-a-script-from-your-path
export PATH=$PATH:$HOME/.pub-cache/bin

# JAVA
export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export PATH=/usr/local/opt/openjdk@11/bin:$PATH
export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"

# Andoroid Studio
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK_ROOT/tools/bin:$PATH
export PATH=$ANDROID_SDK_ROOT/emulator:$PATH
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH

# libpg
export PATH="/usr/local/opt/libpq/bin:$PATH"

# https://github.com/starship/starship
eval "$(starship init zsh)"

# Git command
alias gad='git add'
alias gbr='git branch'
alias gch='git checkout'
alias gbc='git checkout $(git branch -a --sort=-authordate | cut -b 3- | grep -v -- "->" | peco | sed -e "s%remotes/origin/%%")'
alias gfa='git fetch -a'
alias gpsh='git push origin `git rev-parse --abbrev-ref HEAD`'
alias gpll='git pull origin `git rev-parse --abbrev-ref HEAD`'
alias grb='git rebase'
alias glog='git log --pretty=short --graph'
alias grs='git reset --soft HEAD^'
alias gst='git status'
alias gg='git grep'
alias gclear='git branch --merged | grep -v "*" | xargs -I % git branch -d %'
alias gdfn='git diff HEAD..HEAD^ --name-only'
# commitizen https://github.com/commitizen/cz-cli
alias gcz='git-cz --disable-emoji' 

# shift-jisでの差分
alias gdf_sjis='git diff --cached | nkf -w | pyenv exec pygmentize -l diff | less -R'

# https://github.com/github-changelog-generator/github-changelog-generator
alias ghcg="github_changelog_generator"
# fork元を操作するコマンド
alias gaup='git remote add upstream'
alias gfup='git fetch upstream'
alias gmup='git merge upstream/master'
# lazygit
# https://github.com/jesseduffield/lazygit
alias lg='lazygit'

# docker
alias d='docker'
alias dc='docker-compose'
# docker command
alias dcache-clear="docker system prune; rm ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2" # 不要コンテナ・キャッシュ削除

# Node
# node_modulesの容量確認・削除
alias check_nm="find . -name \"node_modules\" -type d -prune -print | xargs du -chs;"
alias rm_nm="find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;"
# renovateの設定が合っているかを確認する
alias check_renovate="npx --package renovate -c 'renovate-config-validator'"

# 隠しファイル表示切り替え
alias vifile='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder'
alias hifile='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder'

# xls, docs, movie, sql, zipなどをgrepさせるCLI
# https://github.com/phiresky/ripgrep-all
# alias rg='rga'

# 翻訳するコマンド(REPL) 
# TODO: https://github.com/soimort/translate-shell の設定
alias trans='gawk -f <(curl -Ls git.io/translate) -- -shell'
# 英語の校正ツール https://github.com/btford/write-good
alias wg='write-good'

# vim 
alias vi='nvim'
alias vim='nvim'
alias vvim='/usr/bin/vim'

# https://github.com/Peltoche/lsd
alias ls='lsd'

# ポートデバッグ
alias findport='lsof -i -P | grep '
alias killprocess='kill -9 '

# debug brew: https://stackoverflow.com/questions/39797078/another-active-homebrew-process-is-already-in-progress
alias debugbrew='rm -rf /usr/local/var/homebrew/locks'

# change directory repository
function cd-repo() {
    local src=$(ghq list --full-path | peco --query "$BUFFER")
    if [ -n "$src" ]; then
        BUFFER="cd $src"
        zle accept-line
    fi 
    zle -R -c
}

zle -N cd-repo
bindkey '^]' cd-repo

# Find the directory you want to move
function cdl() {
    if [ $# -gt 1 ]; then
        echo 'Usage: cdl ../'
        return
    fi

    local base='./'
    if [ $# = 1 ]; then
        base=$1
    fi 
    local path=$(ls -1a $base | peco --query "$BUFFER")
    if [ -n "$path" ]; then
        local selected="$base$path"
        local type=$(/usr/bin/file -b $selected)
        if [ $type = 'directory' ]; then
            cd $selected
            return
        fi 
        if [ "`echo $type | /usr/bin/grep 'text'`" ]; then
            # TODO: Open file
            echo "code $selected"
            return
        fi
        echo "cannot open $type: $selected"
        return
    fi 
}

# Repeat script
function repeat() {
    shift
    for i in `seq $1`; do
      $@
    done
}

# init .gitignore
# curl https://gitignore.io/api/node,rust
function init-gitignore() {
    if [ $# == 0 ]; then
        echo 'Usage: init-gitignore node,rust'
        return
    fi
    curl https://gitignore.io/api/$1 > .gitignore
}
