
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set incsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" Custom variables I inserted
set tabstop=2
set shiftwidth=2
set expandtab
ino jj <esc>

" code fold settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable        "dont fold by default
"set foldlevel=1         "this is just what i use

let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let Tlist_WinWidth=50
map <F4> :TlistToggle<cr>

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

let mapleader = ","

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

nnoremap <leader>w <C-w>v<C-w>l

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>( :%s/(/ ( <return>
nnoremap <leader>) :%s/)/ ) <return>
nnoremap <leader>d :%s/ \+/ /<return>
nnoremap <leader>= ggvG=

call pathogen#infect()

colorscheme molokai
set guifont=Menlo\ Regular:h12

set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

noremap ; :

function! CleanupWhitespace() " {{
  let _s = @/
  let l  = line(".")
  let c  = col(".")
  keepjumps :%s/\v\s+$//e
  let @/ = _s
  call cursor(l, c)
endfunction "}}

function! CleanupBrackets() " {{
  let l = line(".")
  let c = col(".")
  keepjumps silent :%s/)\([^" :]\)/) \1/e
  keepjumps silent :%s/\([^" :]\)(/\1 (/e
  keepjumps silent :%s/(\(\S\)/( \1/e
  keepjumps silent :%s/\(\S\))/\1 )/e
  keepjumps silent :%s/()/( )/e
  call cursor(l, c)
endfunction "}}

augroup cleanUp  "{{
  autocmd!
  " Delete trailing whitespace on save
  autocmd BufWritePre * :call CleanupWhitespace()
  autocmd BufWritePre *.lua :call CleanupBrackets()
augroup END  " }}

augroup fileOpen "{{
  autocmd!
  "set fold lever start
augroup END "}}

let &winwidth = &lines * 7 / 10
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>e :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap H ^
nnoremap L $

set foldlevelstart=0
":autocmd filetype lua
iabbrev mtb MOAITextbox
":autocmd FileType lua
iabbrev mp MOAIProp2D
iabbrev ret return
iabbrev func function

onoremap b /end<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap ie :<c-u>execute "normal! /\w\+@"<cr>
:onoremap ih :<c-u>execute "normal! /@\r:nohlsearch\rkvg_"<cr>
