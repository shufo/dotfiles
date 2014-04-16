version 6.0
if &cp | set nocp | endif
nnoremap  :nohlsearch
map Q gq
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
vmap <BS> "-d
inoremap  u
let &cpo=s:cpo_save
unlet s:cpo_save

set encoding=utf-8
set termencoding=utf-8
set ambiwidth=double
set autoindent
set background=dark
set backspace=indent,eol,start
"set backup
"set backupdir=~/.vimbackup
set clipboard=unnamed
set cmdheight=2
"set directory=~/.vimbackup
set expandtab
set tabstop=4
set fileencodings=guess,ucs-bom,latin1,iso-2022-jp-3,utf-8,euc-jisx0213,euc-jp,cp932
set formatexpr=autofmt#japanese#formatexpr()
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
set helplang=ja
set hidden
set hlsearch
set ignorecase
set incsearch
set langmenu=ja_ja.utf-8.macvim
set laststatus=2
"set migemo
"set migemodict=/Applications/MacVim.app/Contents/Resources/vim/runtime/dict/migemo-dict
set mouse=a
set ruler
"set runtimepath=~/.vim,/Applications/MacVim.app/Contents/Resources/vim/vimfiles,/Applications/MacVim.app/Contents/Resources/vim/runtime,/Applications/MacVim.app/Contents/Resources/vim/vimfiles/after,~/.vim/after,/Applications/MacVim.app/Contents/Resources/vim/plugins/autofmt,/Applications/MacVim.app/Contents/Resources/vim/plugins/kaoriya,/Applications/MacVim.app/Contents/Resources/vim/plugins/vimdoc-ja
set showmatch
set smartcase
set smarttab
set title
set wildmenu

set nocompatible               " be iMproved
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'zenorocha/dracula-theme'
"NeoBundle 'Shougo/vimproc'
"NeoBundle 'VimClojure'
"NeoBundle 'Shougo/vimshell'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/vimfiler'
"NeoBundle 'jpalardy/vim-slime'
"NeoBundle 'bling/vim-airline'
"NeoBundle 'scrooloose/syntastic'
"NeoBundle 'alpaca-tc/alpaca_powertabline'
"NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'
"let g:Powerline_symbols = 'fancy'
"set t_Co=256
set guifont=Ricty\ Regular\ for\ Powerline:h14
set guifontwide=Ricty\ Regular\ for\ Powerline:h14
let g:airline_powerline_fonts = 1

filetype plugin indent on     " required!
filetype indent on
syntax on

" vim: set ft=vim :

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ
