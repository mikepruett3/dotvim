set nocp
call pathogen#infect()
call pathogen#helptags()
syntax on

if has("autocmd")
  filetype plugin indent on
endif

scriptencoding utf-8
set encoding=utf-8

set term=xterm
set t_Co=256
set background=dark
colorscheme default
"colorscheme jellybeans

set number
set autoindent
set backspace=indent,eol,start
set history=1000
set undolevels=1000
set ruler
set incsearch
set tabstop=4 shiftwidth=4 expandtab

set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y] [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

set hidden
set ignorecase
set showmatch
set vb
set noerrorbells
set showcmd
"set mouse=a

if has("vms")
  set nobackup
else
  set backup
endif

if has("autocmd")
   filetype plugin indent on
endif

augroup PatchDiffHighlight
  autocmd!
  autocmd BufEnter  *.patch,*.rej,*.diff   syntax enable
augroup END

set list
let &listchars="tab:\uBB\uBB,trail:\uB7,nbsp:~"

"nnoremap ; :
"nnoremap : ;
