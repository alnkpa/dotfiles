syntax enable
colorscheme solarized

if has('gui_running')
    set background=light
else
    set background=dark
endif

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

call plug#begin()
Plug '/usr/share/vim/vimfiles/plugin/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
Plug 'powerline/powerline', { 'rtp': 'powerline/bindings/vim' }
Plug 'ap/vim-buftabline'
Plug 'Raimondi/delimitMate'
call plug#end()

nnoremap <silent> t :FZF<CR>
nnoremap <silent> <C-b> :Gblame<CR>
nnoremap <C-f> :CtrlSF 
vnoremap <silent> <C-f> :<BS><BS><BS><BS><BS>CtrlSF <C-R>*<CR>
let g:ctrlsf_default_root='project'
set laststatus=2

set hidden
nnoremap gT :bnext<CR>
nnoremap gt :bprev<CR>
