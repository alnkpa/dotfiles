execute pathogen#infect()
call pathogen#helptags()
colorscheme solarized

let mapleader=","
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
inoremap jj <esc>
filetype plugin indent on

" don't lose selection when changing indent
"
xnoremap <  <gv
xnoremap >  >gv
