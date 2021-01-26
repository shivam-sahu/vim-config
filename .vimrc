"Vundle settings

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"all vundle#begin('~/some/path/here')

" Language Client
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
" TypeScript Highlighting
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
" enhanced highlight
Plugin 'octol/vim-cpp-enhanced-highlight'
"bracket plugin
Plugin 'lyuts/vim-rtags'
Plugin 'frazrepo/vim-rainbow'
" File Explorer with Icons
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
"async tasks 
Plugin 'skywind3000/asyncrun.vim'
" File Search
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
"commentor
Plugin 'preservim/nerdcommenter'
" colorscheme installed 
Plugin 'nanotech/jellybeans.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'
Plugin 'w0ng/vim-hybrid'
Plugin 'tpope/vim-vividchalk'
Plugin 'dracula/vim'
Plugin 'lokaltog/vim-distinguished'
Plugin 'marcopaganini/termschool-vim-theme'
Plugin 'NLKNguyen/papercolor-theme'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif
" ================ Visualization ====================
"theme settings
syntax on
set background=dark

"gruvbox settings

" let g:gruvbox_termcolors = '256'
" "let g:gruvbox_contrast_dark = 'hard'
"colorscheme gruvbox 
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
 
" TODO: improve behaviour
" reload files changed outside vim
set autoread
" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
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
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Give more space for displaying messages.
set cmdheight=2
"show when leader key is pressed
set showcmd
"rainbow brackets
let g:rainbow_active = 1

"Nerd Tree settings 
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
"automatically starts nerd tree when no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

"file search settings
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
"split window and split terminal settings
" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

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
nnoremap <leader>D "_D
vnoremap <leader>d "_d

"============External configs====================
"auto close brackets
source ~/.vim/config/autoclose.vim 
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"keybindings
" compile and run c++ from vim
"autocmd filetype cpp  nnoremap <C-x> :!g++ -std=c++14 -Wall -Wextra -pedantic -Wformat=2 -Wfloat-equal -Wlogical-op -Wredundant-decls -Wconversion -Wcast-qual -Wcast-align -Wuseless-cast -Wno-shadow -Wno-unused-result -Wno-unused-parameter -Wno-unused-local-typedefs -Wno-long-long -DLOCAL_PROJECT -g -DLOCAL_DEBUG -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC % -o  %:r.out -std=c++17 && ./%:r.out <CR>
autocmd filetype cpp  nnoremap <C-x> :w <bar> :! g++ -std=c++14 -Wall -Wextra -pedantic -Wformat=2 -Wfloat-equal -Wlogical-op -Wredundant-decls -Wconversion -Wcast-qual -Wcast-align -Wuseless-cast -Wno-shadow -Wno-unused-result -Wno-unused-parameter -Wno-unused-local-typedefs -Wno-long-long -DLOCAL_PROJECT -g -DLOCAL_DEBUG -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC % -o  %:r.out -std=c++17 && ./%:r.out <CR>
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

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
