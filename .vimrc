let mapleader = ","

filetype plugin on
filetype plugin indent on

" BEGIN VUNDLE
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vundle plugins
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'ctrlpvim/ctrlp.vim'

" Colors
Plugin 'rainux/vim-desert-warm-256'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/256-jungle'
Plugin 'jnurmine/Zenburn'

" Languages
Plugin 'kchmck/vim-coffee-script'

" Ruby/Rails
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'

" Exuberant Ctags
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" END VUNDLE 

" get rid of .swp and ~ files
set directory=/tmp
set backupdir=/tmp

" general
set fileencodings=utf-8,ucs-bom,latin1
set nocp
set noautochdir
set mouse=a
set vb t_vb=
syntax on

colorscheme molokai

" editing
set autoindent
set expandtab
set sts=2
set sw=2
set bs=2
set shiftround
set showmatch

" search
set hlsearch
set incsearch
set ignorecase

" visual
set ruler
set number
set cursorline

" show status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\[HEX=\%02.2B]\ [%p%%]\ [LEN=%L]%{fugitive#statusline()}
set laststatus=2

"set guifont=Dejavu\ Sans\ mono\ 9
"set guifont=droid\ sans\ mono\ 9
"set guifont=Inconsolata\ 11
"set guifont=Consolas\ 10
"set guifont=Monaco\ 10

" disable arrow keys
noremap <up> <nop>
noremap <down> <nop> map <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" vim
set t_Co=256
set background=dark

" window split management
noremap <silent> <C-h> :wincmd h<CR>
noremap <silent> <C-j> :wincmd j<CR>
noremap <silent> <C-k> :wincmd k<CR>
noremap <silent> <C-l> :wincmd l<CR>

" Select a word
noremap <space> viw

" edit .vimrc quickly
noremap <leader>ev :vsplit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

"Spec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Language speicific configs
let python_highlight_all = 1

au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly
