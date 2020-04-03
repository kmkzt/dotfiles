" default config 
set number 
set title 
set showmatch
set tabstop=2
set smartindent 
set ignorecase 
set smartcase
set wrapscan

" nvim plug
if &compatible
  set nocompatible
endif

" neovim config
set runtimepath^=~/.vim 
" set runtimepath+=~/.vim/after

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let &packpath = &runtimepath

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
		call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    " Theme
    call dein#add('altercation/vim-colors-solarized')

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

		call dein#add('rust-lang/rust.vim')
    " Syntax Plugin
    call dein#add('leafgarland/typescript-vim')

    " snipet tools
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('lighttiger2505/deoplete-vim-lsp')

    if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif
  call dein#end()
call dein#save_state()
endif

" theme: https://github.com/altercation/vim-colors-solarized
colorscheme solarized
let g:solarized_termcolors=256
syntax enable

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

" https://github.com/Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

" https://github.com/rust-lang/rustfmt
let g:rustfmt_autosave = 1
