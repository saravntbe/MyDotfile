set nocompatible
filetype on
execute pathogen#infect()
"set rtp+=~/.vim/bundle/vundle
"call vundle#rc()

"Bundle 'mileszs/ack.vim'
"Bundle 'kien/ctrlp.vim'
"Bundle 'scrooloose/nerdtree'
"Bundle 'bling/vim-airline'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'tpope/vim-fugitive'
"Bundle 'nono/vim-handlebars'
"Bundle 'w0ng/vim-hybrid'
"Bundle 'plasticboy/vim-markdown'
"Bundle 'tpope/vim-ragtag'
"Bundle 'vim-ruby/vim-ruby'
"Bundle 'tpope/vim-surround'
"Bundle 'mattn/zencoding-vim'
"Bundle 'SirVer/ultisnips'
"Bundle 'airblade/vim-gitgutter'
"Bundle 'tabular'
"Bundle 'tomorrow-theme'
"Bundle 'vim-yardoc'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'vim-emblem'

"vim airline plugin
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'



"call togglebg#map("<F5>") " For Solarized

let mapleader = ","
syntax enable

" Mappings {{{

" Insert mode mappings {{{
inoremap <C-l> <space>=><space>
inoremap <C-s> <Esc>:w<CR>a
" }}}

" Normal mode mappings {{{
nnoremap <C-s> :w<CR>
nnoremap <leader>ev :vs $MYVIMRC<CR>
nnoremap <leader>gs :Gstatus<CR><C-W>15+
nnoremap <leader>m :NERDTreeToggle<CR>
nnoremap <leader>rs :!clear;rake<CR>
nnoremap <leader>a :Ack 
nnoremap <leader>d :bd<CR> 
nnoremap <leader>w :w<CR>
nnoremap <leader><cr> :noh<CR>
nnoremap <leader>l :ls<CR>:b
nnoremap <leader>t :CtrlP<CR>
nnoremap n nzz
nnoremap N Nzz
" }}}

" Visual mode mappings {{{
vnoremap < <gv
vnoremap > >gv

" Execute dot in the selection
vnoremap . :norm.<CR>
" }}}

" }}}

" General settings {{{
set t_Co=256
set autoindent
set backspace=indent,eol,start
"set colorcolumn=80
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set gdefault
set guifont=Inconsolata\ 10.5
set guioptions-=Be
set guioptions=aAc
set hlsearch
set ignorecase
set incsearch
set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:⋅
set noswapfile
set number
"set shell=/bin/bash
set shell=/usr/local/bin/zsh
set showmatch
set smartcase
"set smartindent
set term=screen-256color
set ts=2 sts=2 sw=2 expandtab
set visualbell
set winheight=999
set winheight=5
set winminheight=5
set winwidth=84
" }}}

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set background=light
let g:hybrid_use_Xresources = 1
"colorscheme hybrid
colorscheme Tomorrow

" Autocommands {{{

".ru files are Ruby.
au BufRead,BufNewFile *.ru set filetype=ruby
au BufRead,BufNewFile [vV]agrantfile set filetype=ruby

" Markdown gets auto textwidth
au Bufread,BufNewFile *.md set filetype=markdown textwidth=79
au Bufread,BufNewFile *.markdown set textwidth=79

" .feature files are Cucumber.
au Bufread,BufNewFile *.feature set filetype=cucumber
" }}}

" Statusline {{{
hi User1 ctermbg=white    ctermfg=black   guibg=#89A1A1 guifg=#002B36
hi User2 ctermbg=red      ctermfg=white   guibg=#aa0000 guifg=#89a1a1

function! GetCWD()
  return expand(":pwd")
endfunction

function! IsHelp()
  return &buftype=='help'?' (help) ':''
endfunction

function! GetName()
  return expand("%:t")==''?'<none>':expand("%:t")
endfunction

set statusline=%1*[%{GetName()}]\ 
set statusline+=%<pwd:%{getcwd()}\ 
set statusline+=%2*%{&modified?'\[+]':''}%*
set statusline+=%{IsHelp()}
set statusline+=%{&readonly?'\ (ro)\ ':''}
set statusline+=[
set statusline+=%{strlen(&fenc)?&fenc:'none'}\|
set statusline+=%{&ff}\|
set statusline+=%{strlen(&ft)?&ft:'<none>'}
set statusline+=]\ 
set statusline+=%=
set statusline+=c%c
set statusline+=,l%l
set statusline+=/%L\ 

set laststatus=2

" }}}

" Specific configurations {{{
let g:molokai_original = 1
" }}}

" vim: foldmethod=marker foldmarker={{{,}}}
