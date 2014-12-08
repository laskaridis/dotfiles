
set nocompatible 

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Create missing directories when editing files
Plugin 'pbrisbin/vim-mkdir'

" Navigate code
Plugin 'vim-scripts/ctags.vim'
" Support for bundler
Plugin 'tpope/vim-bundler'
" Closes code structures automatically
Plugin 'tpope/vim-endwise'
" Navigate in rails projects
Plugin 'tpope/vim-rails'
" Support for ruby code
Plugin 'vim-ruby/vim-ruby'

call vundle#end()
filetype plugin indent on

set number
set numberwidth=5

set ruler
set showcmd
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set noswapfile
set backspace=2
set autoindent
set expandtab
set smarttab
set nowrap
set laststatus=2

set splitbelow
set splitright

set textwidth=120
set colorcolumn=+1

syntax on
