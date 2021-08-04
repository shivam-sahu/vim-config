" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight'
"commentor
Plug 'preservim/nerdcommenter'
" colorscheme installed 
Plug 'NLKNguyen/papercolor-theme'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif
" ================ Visualization ====================
"theme settings
syntax on
set background=dark
"papercolor settings
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   },
 	\   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1 
  \     }
  \   }
  \ }
colorscheme PaperColor
" enable 256bit colors - also: override gnome-terminal's settings
set t_Co=256
" ================ Indentation ======================

set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set smarttab
" ================ Encoding =========================

"set encoding to utf8
if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif
" ================ Performance ======================

" fix slow scrolling that occurs when using mouse and relative numbers
set lazyredraw
" vim timeout (forgot why I need this or if I do at all)
set ttyfast
set ttimeoutlen=10

" ================ Encoding =========================

"set encoding to utf8
if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif
" ================ Searching ========================

" Ignorecase when searching
set ignorecase

" incremental search - Vim starts searching when we start typing
set incsearch

" When searching try to be smart about cases
set smartcase

" Highlight search results
"set hlsearch

" toggle search highlighting
nnoremap <F3> :set hlsearch!<CR>
" ================ File management ==================
 
" Turn off swap files
set noswapfile
set nobackup
set nowb
" wildmenu for file navigation
set wildignore+=*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk
set wildmenu
set wildmode=longest:full,full
set wildignorecase
" ================ Misc =============================
" TextEdit might fail if hidden is not set.
set hidden
" highlight matching braces
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=0
" When the last window will have a status line (2 = always)
set laststatus=2
" disable wrapping of long lines into multiple lines
set nowrap
" turn line numbers on
set number relativenumber
" Start scrolling when we're 8 lines away from margins
set scrolloff=8
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50
" set the leader key to space
let mapleader =","
let g:mapleader ="," 
let loaded_matchparen = 1
"system clipboard
set clipboard=unnamedplus
" don't give |ins-completion-menu| messages.
set shortmess+=c
" Give more space for displaying messages.
set cmdheight=2
"show when leader key is pressed
set showcmd
"split window and split terminal settings
" open new split panes to right and below
set splitright
set splitbelow

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"use normal d to cut and leader d to delete
nnoremap <leader>d "_d
"nnoremap <leader>d "_d
vnoremap <leader>d "_d

"use r for redo 
nnoremap r <C-R>
vnoremap r <C-R>
"============External configs====================
"auto close brackets
source ~/.vim/config/autoclose.vim 
"keybindings
" compile and run c++ from vim
" for c++ flags u can refer  
"https://codeforces.com/blog/entry/15547
"-DLOCAL flag is added in cpp because it defines local variable while
"compling code locally.
autocmd filetype cpp nnoremap <C-x> :w <bar> :! g++ -std=c++17 -O0 -Wall -Wextra -pedantic -Wformat=2 -Wfloat-equal -Wlogical-op -Wredundant-decls -Wconversion -Wcast-qual -Wcast-align -Wuseless-cast -Wno-shadow -Wno-unused-result -Wno-unused-parameter -Wno-unused-local-typedefs -Wno-long-long -DLOCAL_PROJECT -g -DLOCAL_DEBUG -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -DLOCAL % -o  %:r.out && ./%:r.out <CR>
"autocmd filetype cpp nnoremap <C-X> :w <bar> :! g++ -std=c++17 -O0 -g % -o %:r && ./%:r <CR>
autocmd filetype python nnoremap <C-x> :w <bar> :!python3 % <CR>
" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
"ctrl + h will not work in insert if backspace is not mapped
"inoremap <Backspace> <Esc><C-W><C-h>a

" fast scrolling
nnoremap K 15k
nnoremap J 15j
vnoremap K 15k
vnoremap J 15j
