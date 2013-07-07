" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

let &t_Co = 256

" forget about the future, and lets get on with the past
set nocompatible
set novisualbell

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
set foldmethod=indent
set foldnestmax=10
set foldlevelstart=1
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
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
let mapleader = "'"
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
nnoremap <leader>= ggvG=

call pathogen#infect()
colorscheme molokai

set guifont=DejaVu\ Sans\ Mono\ 10
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

function! CleanupWhitespace() " {{
  let _s = @/
  let l  = line(".")
  let c  = col(".")
  keepjumps :%s/\v\s+$//e
  keepjumps :%s/\v(\n\s*)+%$//e
  let @/ = _s
  call cursor(l, c)
endfunction "}}

function! CleanupWhitespaceInLine() " {{
  keepjumps :s/\v\s+$//e
endfunction "}}

augroup cleanUp  "{{
  autocmd!
  " Delete trailing whitespace on save
  autocmd BufWritePre * :call CleanupWhitespace()
augroup END  " }}

if (match(getcwd(), "mozilla-central") != -1)
  autocmd! cleanUp BufWritePre *

  ino jj <esc>h :call CleanupWhitespaceInLine() <cr>
end

nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

nnoremap p p"p=`]

" Tab management --------------- {{
" kill window
nnoremap K :q<cr>
nnoremap !K :q!<cr>
" create new window and switch to it
nnoremap <leader>w :tabnew<cr>
nnoremap <leader>p :tabp<cr>
nnoremap <leader>n :tabn<cr>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
" }} end tab management
" h and l beginning and end of line
nnoremap H ^
onoremap H ^
vnoremap H ^
nnoremap L $
onoremap L $
vnoremap L $
" Git
nnoremap <leader>gg :Git
nnoremap <leader>gd :Gdiff
nnoremap <leader>gw :Gwrite
nnoremap <leader>gr :Gread
nnoremap <leader>gm :Gmove
nnoremap <leader>gc :Gcommit
nnoremap <leader>gs :Gstatus
nnoremap <leader>gb :Gblame
onoremap b /end<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap i, :<c-u>normal! t,vT,<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap i< :<c-u>normal! T>vt<<cr>
onoremap ie :<c-u>execute "normal! /\w\+@"<cr>
onoremap ih :<c-u>execute "normal! /@\r:nohlsearch\rkvg_"<cr>

nnoremap <c-f> :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=4
  endif
endfunction

noremap <c-q> :call QuickFixToggle()<cr>

let g:quickfix_is_open = 1
function! QuickFixToggle()
  echo g:quickfix_is_open
  if g:quickfix_open == 1
    let g:quickfix_is_open = 0
    cclose
  else
    copen
    let g:quickfix_is_open = 1
  endif
  copen
endfunction

"Backup stuff {{
set backup
set backupdir=$HOME/.vimbackup//
set directory=$HOME/.vimswap//
set viewdir=$HOME/.vimviews//
if exists("&undodir")
  set undodir=$HOME/.vimundo//
endif
" Creating backup dirs if they don't exist
for dir in [&backupdir, &undodir, &directory]
  if !isdirectory(expand(dir))
    call mkdir(expand(dir), "p")
  endif
endfor
"  }}

" tagbar-------------- {{
nnoremap <leader>b :TagbarToggle<cr>
let g:tagbar_width = 20
" }}
"
" nerd-tree ------------ {{
nnoremap <leader>f :NERDTreeMirrorToggle<CR>
" }}
"
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

"edit filetype
nnoremap <leader>ft :set filetype=
:let g:html_indent_script1 = "inc"
:let g:html_indent_style1 = "inc"

" set clipboard
set clipboard=unnamedplus
