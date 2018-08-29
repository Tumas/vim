let mapleader = ","

" plugin management
"
packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" colors
"
call minpac#add('tomasr/molokai')
call minpac#add('AlessandroYorba/Alduin')
call minpac#add('croaker/mustang-vim')

colorscheme alduin

set t_Co=256
set background=dark

" file management
"
call minpac#add('scrooloose/nerdtree')
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-projectionist')

set rtp+=/usr/local/opt/fzf
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

let g:fzf_action = { 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
noremap <C-p> :FZF<CR>

" git
"
call minpac#add('tpope/vim-fugitive')

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
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\[HEX=\%02.2B]\ [%p%%]\ [LEN=%L]
set laststatus=2

" disable arrow keys
noremap <up> <nop>
noremap <down> <nop> map <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" window split management
noremap <silent> <C-h> :wincmd h<CR>
noremap <silent> <C-j> :wincmd j<CR>
noremap <silent> <C-k> :wincmd k<CR>
noremap <silent> <C-l> :wincmd l<CR>

" Select a word
noremap <space> viw

" show relative path to current file
noremap <leader>e :echo @%<CR>
noremap - ddp

" use specific color to visualize 120+ columns
let &colorcolumn=join(range(121,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" auto remove all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" HTML
"
call minpac#add('mattn/emmet-vim')
call minpac#add('othree/html5.vim')

" CSS
"
call minpac#add('ap/vim-css-color')
call minpac#add('hail2u/vim-css3-syntax')

" JavaScript
"
call minpac#add('pangloss/vim-javascript')

" TAGS
"
" set tags=./tags;,tags;
" noremap <Leader>st :TagbarToggle<CR>

" ------------------
"

" Solidity
"
" call minpac#add('tomlion/vim-solidity')

" Python
" let python_highlight_all = 1

" au FileType py set autoindent
" au FileType py set smartindent
" au FileType py set textwidth=79 " PEP-8 Friendly

" Ruby
" run reek & rubocop on current file
noremap <leader>rr  <Esc>:!reek %; rubocop %<CR>

"Spec.vim mappings
"noremap <Leader>t :call RunCurrentSpecFile()<CR>
"noremap <Leader>s :call RunNearestSpec()<CR>
"noremap <Leader>l :call RunLastSpec()<CR>
"noremap <Leader>a :call RunAllSpecs()<CR>

" nmap <silent> <leader>s :TestNearest<CR>
" nmap <silent> <leader>t :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>

" JSON
" treat json files as javascript
:autocmd BufNewFile,BufRead *.json set ft=javascript

" File Search
"
function! s:escape(path)
  return substitute(a:path, ' ', '\\ ', 'g')
endfunction

function! RgHandler(line)
  let parts = split(a:line, ':')
  let [fn, lno] = parts[0 : 1]
  execute 'e '. s:escape(fn)
  execute lno
  normal! zz
endfunction

command! -nargs=+ Frg call fzf#run({
  \ 'source': 'rg -i "<args>"',
  \ 'sink': function('RgHandler'),
  \ 'options': '+m -e --reverse',
  \ })

noremap <C-s> :Frg<Space>
