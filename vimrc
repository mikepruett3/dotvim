"{{{ Load Pathogen.vim First 
set nocp
call pathogen#infect()
call pathogen#helptags()
syntax on
"}}}

"{{{ Check for AutoCMD file type (For Pathogen) 
if has("autocmd")
    filetype plugin indent on
endif
"}}}

"{{{ Check for multi_byte VIM support, if so, then use Unicode (UTF-8) 
if has("multi_byte")
    if has("win32") || has("win16") " Genius bit of code, lifted from http://stackoverflow.com/questions/6846898/determine-operating-system-in-vimrc
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
"}}}

"{{{ Set the prefered Background and Colorscheme 
set background=dark

if (&term =~ "xterm") || (&term =~ "screen")
    set t_Co=256
endif

if &t_Co >= 256 || has("gui_running")
    colorscheme jellybeans
else
    colorscheme default
endif
"}}}

"{{{ Setting Vim Behaviour 
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
"}}}

"{{{ Undo settings 
set history=1000                    " remember more command and search history
set undolevels=1000                 " use many levels of undo
set title                           " change the terminal's title
set visualbell                      " don't beep
set noerrorbells                    " don't beep
"}}}

"{{{ No Backups for VIM Backup Files 
if has("vms")
  set nobackup
else
  set backup
endif
"}}}

"{{{ Enable Auto-Folds for Vimrc Files 
augroup vimrc
    autocmd BufEnter .vimrc,vimrc,.gvimrc setlocal foldmethod=marker
augroup END
"}}}

"{{{ Highlight the Differences when looking at diff files 
augroup PatchDiffHighlight
    autocmd!
    autocmd BufEnter  *.patch,*.rej,*.diff   syntax enable
augroup END
"}}}

"{{{ Configuration for tab characters, and trailing spaces 
set list
let &listchars="tab:\uBB\uBB,trail:\uB7,nbsp:~"
"}}}
