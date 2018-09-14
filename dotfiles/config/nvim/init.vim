syntax enable
colorscheme solarized
let mapleader = ";"

if has('gui_running')
    set background=light
else
    set background=dark
endif


" don't lose selection when changing indent
"
xnoremap <  <gv
xnoremap >  >gv

call plug#begin()
Plug 'xolox/vim-misc'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'peterhoeg/vim-qml'
Plug 'easymotion/vim-easymotion'
Plug 'rhysd/vim-clang-format'
Plug '907th/vim-auto-save'
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'wellle/targets.vim'
Plug 'arakashic/chromatica.nvim'
Plug 'PProvost/vim-ps1'
Plug 'machakann/vim-highlightedyank'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" yank highlight
let g:highlightedyank_highlight_duration = 250

let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" LSP servers
" - see note 'tools' for installation instructions
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
    \ }
let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '/home/patrick/.config/nvim/settings.json'
set completefunc=LanguageClient#complete
" airline
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

nnoremap <C-f> :CtrlSF<CR>
vnoremap <silent> <C-f> :<BS><BS><BS><BS><BS>CtrlSF <C-R>*<CR>
let g:ctrlsf_default_root='project'
let g:ctrlsf_ackprg = 'rg'
set laststatus=2

nmap F <Plug>(easymotion-overwin-f2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" highlight word under cursor without jumping
nnoremap # #*

" close quickfix window
nnoremap <leader>q :cclose<CR>

" edit config
nnoremap <leader>ce :e $MYVIMRC<CR>
" reload config
nnoremap <leader>cr :so $MYVIMRC<CR>

" buffers
"   navigation
noremap <C-e> :bn<CR>
noremap <C-q> :bN<CR>

" fzf
noremap ' :Buffers<CR>
nnoremap <silent> t :GFiles<CR>
noremap <leader>n :Files<CR>
noremap <leader>v :Tags<CR>

" c++
nnoremap <silent> <leader>d :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>i :call LanguageClient_textDocument_implementation()<CR>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>e :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <leader>g :call LanguageClient_textDocument_codeAction()<CR>
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format_on_insert_leave = 1
nnoremap <silent> <leader>f :ClangFormat<CR>
vnoremap <silent> <leader>f :ClangFormat<CR>

set hidden
" Complete opts
set completeopt=menuone,menu,longest
set completeopt-=preview
set showcmd            " display incomplete commands

set hidden             " allow unsafed buffers
set nobackup           " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set tw=80
set colorcolumn=+1     " show a ruler after column 80
set t_Co=256
set scrolloff=3        " keep n lines above/below the cursor

set number
set nowrap
set showmode
set ignorecase
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=4
set shiftwidth=4
set expandtab
set incsearch
set cmdheight=1
set showmatch                   " highlight matching [{()}]
set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches
set lazyredraw                  " don't update screen inside macros, etc
set matchtime=2                 " ms to show the matching paren for showmatch
set number                      " line numbers
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set showmatch                   " show matching brackets while typing
set display=lastline,uhex       " show last line even if too long; use <xx>
set linebreak                   " break on what looks like boundaries
set showbreak=↳\                " shown at the start of a wrapped line
"set textwidth=80                " wrap after 80 columns
set virtualedit=block           " allow moving visual block into the void
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
inoremap jj <esc>
filetype plugin indent on

set tags=./tags;

set listchars=tab:↹·,extends:⇉,precedes:⇇,nbsp:␠,trail:␠,nbsp:␣
set wildignore+=*/tmp/*,*/build/*,*.swp,*.swo,*.zip,.git,.cabal-sandbox

autocmd BufWritePre * %s/\s\+$//e   " Removes trailing spaces
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
