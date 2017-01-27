let mapleader = ","

filetype plugin on
filetype plugin indent on

filetype off

" plugins
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'

" Colors
Plug 'rainux/vim-desert-warm-256'
Plug 'tomasr/molokai'
Plug 'vim-scripts/256-jungle'
Plug 'jnurmine/Zenburn'

" Languages
Plug 'kchmck/vim-coffee-script'
Plug 'Chiel92/vim-autoformat'

" Ruby/Rails
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'

" Tags
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Add plugins to &runtimepath
call plug#end()

let g:vim_markdown_folding_disabled = 1

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

" treat json files as javascript
:autocmd BufNewFile,BufRead *.json set ft=javascript

"Spec.vim mappings
noremap <Leader>t :call RunCurrentSpecFile()<CR>
noremap <Leader>s :call RunNearestSpec()<CR>
noremap <Leader>l :call RunLastSpec()<CR>
noremap <Leader>a :call RunAllSpecs()<CR>

" Language speicific configs
let python_highlight_all = 1

" use specific color to visualize 120+ columns
let &colorcolumn=join(range(121,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" auto remove all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" run reek & rubocop on current file
noremap <leader>rr  <Esc>:!reek %; rubocop %<CR>

au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

" tags
set tags=./tags;,tags;

noremap <Leader>st :TagbarToggle<CR>

" vms
noremap - ddp
