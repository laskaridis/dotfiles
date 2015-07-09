set nocompatible

filetype on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Create missing directories when editing files
Plugin 'pbrisbin/vim-mkdir'
" Finder
Plugin 'ctrlpvim/ctrlp.vim'
" Syntax checking
Plugin 'scrooloose/syntastic'
" Navigate code
Plugin 'vim-scripts/ctags.vim'
" Quoting and parenthesizing support
Plugin 'tpope/vim-surround'
" Support for bundler
Plugin 'tpope/vim-bundler'
" Closes code structures automatically
Plugin 'tpope/vim-endwise'
" Navigate in rails projects
Plugin 'tpope/vim-rails'
" Support for ruby code
Plugin 'vim-ruby/vim-ruby'
" Git support
Plugin 'tpope/vim-fugitive'
" Run specs form vim
Plugin 'thoughtbot/vim-rspec'
" Creates text objects
Plugin 'kana/vim-textobj-user'
" Navigate ruby blocks
Plugin 'nelstrom/vim-textobj-rubyblock'
" Navigate tags in open file
Plugin 'majutsushi/tagbar'

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
set history=50
set backspace=2
set autoindent
set expandtab
set smarttab
set nowrap
set laststatus=2
set nobackup
set nowritebackup
set incsearch
set hlsearch

set splitbelow
set splitright

set textwidth=120
set colorcolumn=+1

let mapleader = " "

colorscheme railscasts

" Display extra whitespace
" set list listchars=tab:»·,trail:·,nbsp:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Exclude files and directories from search path
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/git/*
set wildignore+=*/vcr_cassettes/*

let g:ctrlp_max_files = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:25,results:25'

" Tagbar mappings
nmap <F8> :TagbarToggle<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Tab movement
map <Leader><left> gT
map <Leader><right> gt

" Method movement
map <Leader><up> [m
map <Leader><down> ]m

" Unhighlight search
map <Leader>h :nohlsearch<CR>

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
   autocmd BufReadPost *
     \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal g`\"" |
     \ endif
   "
  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Toggle relative numbers
function! RelativeNumbersToggle()
  if (&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunction
map <Leader>q :call RelativeNumbersToggle()<CR>

" Always use vertical diffs
set diffopt+=vertical

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Include bundled gem tags
set tags+=gems.tags

" Enables % command to jump between kwywords module, def, do and
" corresponding end.
runtime macros/matchit.vim

syntax on
