"
" custom
"
"

set encoding=utf8
scriptencoding utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
set backspace=2

set showtabline=2
set laststatus=2
set imdisable 
set transparency=10
map <silent> gw :macaction selectNextWindow:
map <silent> gW :macaction selectPreviousWindow:
set antialias
set guifont=Hack:h12
set lines=60 columns=150
set guioptions-=T
set showcmd 

set nobackup
set visualbell t_vb=

ca tn tabnew
augroup gvimrc
  autocmd!
  autocmd ColorScheme * highlight LineNr ctermfg=11 guifg=#707880
augroup END
set background=dark
colorscheme hybrid



