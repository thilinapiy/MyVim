" Sets how many lines of history VIM has to remember
set history=1024

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread


" with a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
" let mapleader = ','
" let g:mapleader = ','

" Fast saving
nmap <leader>w :w!<cr>

" Set 10 lines to the cursor - when moving vertically using j/k
set so=10

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Highlight over length 
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" set colorcolumn=85
" highlight ColorColumn guibg=Gray14 ctermbg=DarkGray 

set cursorline
highlight cursorline ctermbg=white ctermfg=DarkGray

" Height of the command bar
" set cmdheight=1

" A buffer becomes hidden when it is abandoned
" set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Set annoying sound on errors
set errorbells
set visualbell

" Enable syntax highlighting
syntax enable

colorscheme desert
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart
set smarttab
set smartindent

" Set 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Status line format
set laststatus=2
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %=\ col:%c%V\ lin:%l\,%L\ %P\ %{strftime(\"%d/%m/%Y-%H:%M\")}

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.pp :call DeleteTrailingWS()
autocmd BufWrite *.erb :call DeleteTrailingWS()

" Toggle spell checking
map <leader>sp :setlocal spell!<cr>

" Turn persistent undo on 
try
    set undodir=~/.vim/temp_dirs/undodir
        set undofile
catch
endtry

" Map auto complete of (, ", ', [
" inoremap $1 ()<esc>i
" inoremap $2 []<esc>i
" inoremap $3 {}<esc>i
" inoremap $4 {<esc>o}<esc>O
" inoremap $q ''<esc>i
" inoremap $e ""<esc>i
" inoremap $t <><esc>i
