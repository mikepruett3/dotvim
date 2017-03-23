" Load Pathogen.vim first
set nocompatible
call pathogen#infect()
call pathogen#helptags()
syntax enable
filetype plugin on
set path+=**
set wildmenu

" NetRW File Browser Built-in Plugin Settings
let g:netrw_banner=0            " Disables Banner
let g:netrw_browse_split=4      " Open in the Prior Window
let g:netrw_altv=1              " Open Splits to the right
let g:netrw_liststyle=3         " Tree View
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Set viewdir path for Windows

" Genius bit of code, lifted from:
" http://stackoverflow.com/questions/6846898/determine-operating-system-in-vimrc
if has("win32") || has("win16")
    set viewdir=$HOME\.vim-view\
endif

" Check for AutoCMD file type (For Pathogen)
if has("autocmd")
    filetype plugin indent on
endif

" Check for multi_byte VIM support, if so, then use Unicode (UTF-8)
if has("multi_byte")
    if has("win32") || has("win16")
        if &termencoding == ""
            let &termencoding = &encoding
        endif
        set encoding=utf-8
    else
        set encoding=utf-8
        if &termencoding == ""
            let &termencoding = &encoding
        endif
    endif
    setglobal fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,latin1
endif
scriptencoding utf-8

" Set the prefered background and colorscheme
set background=dark

if (&term =~ "xterm") || (&term =~ "screen")
    set t_Co=256
endif

if &t_Co >= 256 || has("gui_running")
    colorscheme jellybeans
else
    colorscheme default
endif

" Setting Vim behaviour
set hidden
set nowrap                          " don't wrap lines
set expandtab                       " Convert (expand) tabs to spaces
set tabstop=4                       " a tab is four spaces
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set autoindent                      " always set autoindenting on
set copyindent                      " copy the previous indentation on autoindenting
set number                          " always show line numbers
set shiftwidth=4                    " number of spaces to use for autoindenting
set shiftround                      " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                       " set show matching parenthesis
set ignorecase                      " ignore case when searching
set smartcase                       " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                        " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch                        " highlight search terms
set incsearch                       " show search matches as you type
set showcmd                         " show information about current commands being typed
set ruler                           " shows the current column & row number in the status bar
set laststatus=2                    " allways display the status line
if has("win32") || has("win16")
    set mouse=a                     " allways enable smart mouse support in vim
endif

command! Q q
command! W w
command! WQ wq

" Undo settings
set history=1000                    " remember more command and search history
set undolevels=1000                 " use many levels of undo
set title                           " change the terminal's title
set visualbell                      " don't beep
set noerrorbells                    " don't beep

" Conque Python Settings
let g:ConqueTerm_PyExe = 'C:\Python27\python.exe'
let g:ConqueTerm_PyVersion = 2

" Do not create backups for VIM files
if has("vms")
  set nobackup
else
  set backup
endif

" Automatically save manual folds when exiting, and load folds when opening
" Lifted from:
" http://vim.wikia.com/wiki/Make_views_automatic
augroup AutoFolds
    au BufWinLeave *.* mkview!
    au BufWinEnter *.* silent loadview
augroup END

" Highlight the differences when looking at diff files
augroup PatchDiffHighlight
    autocmd!
    autocmd BufEnter  *.patch,*.rej,*.diff   syntax enable
augroup end

" PowerShell autocommands 
augroup PowerShell
    autocmd BufNewFile,BufRead *.ps1 set filetype=ps1
    autocmd BufNewFile,BufRead *.psd1 set filetype=ps1
    autocmd BufNewFile,BufRead *.psm1 set filetype=ps1
    autocmd BufNewFile,BufRead *.ps1xml set filetype=ps1xml
    autocmd FileType *.ps1 setlocal foldmethod=syntax
    autocmd FileType ps1 set shell=powershell
    autocmd FileType ps1 set shellcmdflag=-command
    autocmd BufNewFile,BufRead *.ps1 :map! <C-T> # TODO(mike)
augroup END

"Template Skeleton Load
"http://vim.wikia.com/wiki/Use_eval_to_create_dynamic_templates
augroup Templates
    au!
    " read in template files
    autocmd BufNewFile *.* silent! execute '0r ~/.vim/headers/skeleton.'.expand("<afile>:e")
augroup END

" Configuration for tab characters, and trailing spaces
set list
let &listchars="tab:\uBB\uBB,trail:\uB7,nbsp:~"

" Remap Keys
"autocmd VimEnter * unmap! r
nnoremap <A-Left> 0
nnoremap <A-Right> $
nnoremap <A-Up> 5k
nnoremap <A-Down> 5j
nnoremap <C-Up> k$
nnoremap <C-Down> j0
nnoremap k gk
nnoremap j gj
nnoremap Q q
nnoremap q <Nop>
nnoremap I i
nnoremap R r
nnoremap <C-S> <Esc>:write<CR>
inoremap <C-S> <C-O>:write<CR>
vmap <C-S> <Esc>:w<CR>gv
nnoremap <C-X> <Esc>:quit<CR>
inoremap <C-X> <Esc>:quit<CR>
nnoremap <C-Z> u
nnoremap <C-Y> <CS-R>
"nnoremap <C-V> <Nop>
