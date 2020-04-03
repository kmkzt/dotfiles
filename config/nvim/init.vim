set runtimepath^=~/.vim 
" set runtimepath+=~/.vim/after
let &packpath = &runtimepath

" default config
set number 
set title 
set showmatch
syntax on 
set tabstop=2
set smartindent 
set ignorecase 
set smartcase
set wrapscan

" nvim plug
if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')
    
    " Theme
    call dein#add('junegunn/seoul256.vim')
    call dein#add('junegunn/goyo.vim')
    call dein#add('junegunn/limelight.vim')

    " Syntax Plugin
    call dein#add('leafgarland/typescript-vim')

    " Prettier
    call dein#add('prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'branch': 'release/1.x',
      \ 'for': [
        \ 'javascript',
        \ 'typescript',
        \ 'css',
        \ 'less',
        \ 'scss',
        \ 'json',
        \ 'graphql',
        \ 'markdown',
        \ 'vue',
        \ 'lua',
        \ 'php',
        \ 'python',
        \ 'ruby',
        \ 'html',
        \ 'swift' ] })
    
    " Language server
    " https://github.com/prabirshrestha/vim-lsp
    " https://github.com/mattn/vim-lsp-settings
    call dein#add('prabirshrestha/async.vim')
    call dein#add('prabirshrestha/vim-lsp')
    call dein#add('mattn/vim-lsp-settings')

    if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif

  call dein#end()
call dein#save_state()
endif

" DOCS -> https://github.com/junegunn/seoul256.vim
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 236
colo seoul256

" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 80

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 2

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'true'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'false'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'true'

" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'always'

" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
let g:prettier#config#parser = 'flow'

" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'prefer-file'

" always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'

" css|strict|ignore
let g:prettier#config#html_whitespace_sensitivity = 'css'
