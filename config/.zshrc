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

# Github SSH
ssh-add -K ~/.ssh/github

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
if [[ -x `which rbenv` ]]; then
    export PATH=$HOME/.rbenv/shims:$PATH
    eval "$(rbenv init -)"
fi
# Python
if [[ -x `which pyenv` ]]; then
    export PATH=$HOME/.pyenv/shims:$PATH
    eval "$(pyenv init -)"
fi

# Rust
export PATH=$HOME/.cargo/bin:$PATH

# Flutter
# Docs -> https://flutter.dev/docs/get-started/install/macos
export PATH=$PATH:$HOME/flutter/bin

# Dart 
# PUB: Dart Package Manager -> https://dart.dev/tools/pub/cmd/pub-global#running-a-script-from-your-path
export PATH=$PATH:$HOME/.pub-cache/bin

# JAVA
export JAVA_HOME=$(/usr/libexec/java_home -v 11)

# Andoroid Studio
export ANDROID_HOME=$HOME/Library/Android
export ANDROID_SDK_ROOT=$ANDROID_HOME/sdk
export PATH=$ANDROID_SDK_ROOT/tools/bin:$PATH
export PATH=$ANDROID_SDK_ROOT/emulator:$PATH
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH

# ssh
alias sk='ssh-add -K'

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
# shift-jisでの差分
alias gdf_sjis='git diff --cached | nkf -w | pyenv exec pygmentize -l diff | less -R'

# node系のコマンド
alias rmnm='rm -rf node_modules yarn.lock package-lock.json'

# docker
alias d='docker'
alias dc='docker-compose'

# commitizen https://github.com/commitizen/cz-cli
alias gcz='git cz'
# https://github.com/github-changelog-generator/github-changelog-generator
alias ghcg="github_changelog_generator"

# fork元を操作するコマンド
alias gaup='git remote add upstream'
alias gfup='git fetch upstream'
alias gmup='git merge upstream/master'
# lazygit
# https://github.com/jesseduffield/lazygit
alias lg='lazygit'

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
alias killport='kill -9 '

# docker command
alias dcclear='docker rm -f $(docker ps -aq)' # dockerのコンテナを一括削除

# サイトのリソースを調べるコマンド
alias resne='research-network'

# start wasm-pack project
# https://rustwasm.github.io/docs/wasm-pack/tutorials/npm-browser-packages/getting-started.html
alias init-wasmpack="cargo generate --git https://github.com/rustwasm/wasm-pack-template"

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

#function repeat
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
        echo 'Usage: get_gitignore.sh node,rust'
        exit 1
    fi
    curl https://gitignore.io/api/$1 > .gitignore
}

# https://github.com/starship/starship
eval "$(starship init zsh)"
