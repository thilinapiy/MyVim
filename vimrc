" Sets how many lines of history VIM has to remember
set history=1024

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
set nocompatible

call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()


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

set termguicolors
" colorscheme desert
colorscheme habamax
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

" Set 1 tab == 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=0

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
" map <leader>sp :setlocal spell!<cr>
set spelllang=en_us

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

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
" let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1


" Goyo 
" enter and exit
function! s:goyo_enter()
  Limelight
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  Limelight!
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" Width
let g:goyo_width = 120

" GitGutter
highlight link GitGutterChangeLine DiffText
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
