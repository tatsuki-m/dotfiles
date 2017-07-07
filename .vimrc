set encoding=utf8
syntax on
set background=dark
filetype plugin indent on
filetype plugin on

"==========display==========
set number		" show line number 
set showmode 		" show mode 
set title		" show editting file
set ruler 		" show ruler
set showcmd		" show command status 
set showmatch		" show parenthesis
set scrolloff=5		" set scroll row number
set cursorline		" highlight current line
set list
set listchars=tab:»-,trail:▸    "visualize unseen character
set laststatus=2        "show status line

" show double-byte space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"========== operation==========
set autoread		" update file automaticaly
set expandtab 		" insert space character insted tab
inoremap <silent> jj <ESC> 	" change from insert to command by typping jj" 
set nosi                " disable smartindext
set tabstop=2 shiftwidth=2 softtabstop=2        "set indent space
set backspace=2

"========== search==========
set wrapscan
set ignorecase
set smartcase
set noincsearch

" ============ neobundle ===============
function! s:WithoutBundles()
  "colorscheme desert
endfunction

if has('vim_starting')
  if &compatible
     set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" ======== plugin =========
function! s:LoadBundles()
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/neomru.vim'
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundleLazy 'Shougo/neosnippet'
  NeoBundle "ctrlpvim/ctrlp.vim"
  NeoBundle "Shougo/neocomplete"
  NeoBundle "scrooloose/nerdtree"
  NeoBundle "tpope/vim-haml"
  NeoBundle 'basyura/unite-rails'
  NeoBundle 'ujihisa/unite-rake'
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'thinca/vim-ref'
  NeoBundle 'slim-template/vim-slim'
  NeoBundle 'szw/vim-tags'
  NeoBundle 'supermomonga/neocomplete-rsense.vim'
  NeoBundle 'scrooloose/syntastic'
"  NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
  NeoBundle 'Shougo/vimproc.vim', {
        \ 'build' : {
        \     'windows' : 'tools\\update-dll-mingw',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make -f make_mac.mak',
        \     'linux' : 'make',
        \     'unix' : 'gmake',
        \    },
        \ }

  if has('lua')
    NeoBundleLazy 'Shougo/neocomplete', {
     \   'depends' : ['Shougo/neosnippet', 'Shougo/context_filetype.vim'],
     \   'autoload' : {
     \       'insert' : 1,
     \   }
     \}
  endif

 " colorschemes
  NeoBundle 'ujihisa/unite-colorscheme'
  NeoBundle 'nanotech/jellybeans.vim'
  NeoBundle 'w0ng/vim-hybrid'
  NeoBundle 'vim-scripts/twilight'
  NeoBundle 'jonathanfilip/vim-lucius'
  NeoBundle 'jpo/vim-railscasts-theme'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'vim-scripts/Wombat'
  NeoBundle 'tomasr/molokai'
  NeoBundle 'vim-scripts/rdark'
  NeoBundle 'w0ng/vim-hybrid'
  NeoBundle 'jpo/vim-railscasts-theme'
  NeoBundle 'altercation/vim-colors-solarized'
  
  NeoBundle 'vim-scripts/rdark'
  " go
  NeoBundle 'fatih/vim-go'
  NeoBundle 'vim-jp/vim-go-extra'
  NeoBundle 'scrooloose/syntastic'

 "typescript
  NeoBundle 'Quramy/tsuquyomi'

 "coffeescript
 NeoBundle 'kchmck/vim-coffee-script'
 NeoBundle 'claco/jasmine.vim'
 NeoBundle 'nathanaelkane/vim-indent-guides'

 " react
 NeoBundle 'pangloss/vim-javascript'
 NeoBundle 'mxw/vim-jsx'
 let g:jsx_ext_required = 0

  " plugin settings
  " for Unite
  let g:unite_enable_start_insert=1
  " for neomru
  let g:neomru#time_format = "(%Y/%m/%d %H:%M:%S) "
  noremap :um :Unite file_mru

  " rense
  let g:rsenseUseOmniFunc = 1
endfunction

" call LoadBundles() if Neobundle was installed, otherwise call WithoutBundles()
function! s:InitNeoBundle()
  if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    filetype plugin indent off
    if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif

    try
      call neobundle#begin(expand('~/.vim/bundle/'))
        call s:LoadBundles()
      call neobundle#end()
    catch
      call s:WithoutBundles()
    endtry
  else
    call s:WithoutBundles()
  endif

  filetype indent plugin on
  syntax on
endfunction

call s:InitNeoBundle()

" settings neocomplete
if neobundle#tap('neocomplete')
  call neobundle#config({
  \   'depends': ['Shougo/context_filetype.vim', 'ujihisa/neco-look', 'pocke/neco-gh-issues', 'Shougo/neco-syntax'],
  \ })
  " < TAB >: completion
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_underbar_completion = 1
  let g:neocomplete#enable_camel_case_completion  =  1
  let g:neocomplete#max_list = 20
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#auto_completion_start_length = 2
  let g:neocomplete#enable_auto_close_preview = 0
  let g:neocomplete#max_keyword_width = 10000

  if !exists('g:neocomplete#delimiter_patterns')
    let g:neocomplete#delimiter_patterns= {}
  endif
  let g:neocomplete#delimiter_patterns.ruby = ['::']

  if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes = {}
  endif

  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif

  let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
  let g:neocomplete#force_omni_input_patterns.typescript = '[^. \t]\.\%(\h\w*\)\?' " Same as JavaScript
  let g:neocomplete#force_omni_input_patterns.go = '[^. \t]\.\%(\h\w*\)\?'         " Same as JavaScript

  let s:neco_dicts_dir = $HOME . '/dicts'
  if isdirectory(s:neco_dicts_dir)
    let g:neocomplete#sources#dictionary#dictionaries = {
          \   'ruby': s:neco_dicts_dir . '/ruby.dict',
          \   'javascript': s:neco_dicts_dir . '/jquery.dict',
          \ }
  endif
  let g:neocomplete#data_directory = $HOME . '/.vim/cache/neocomplete'
  call neocomplete#custom#source('look', 'min_pattern_length', 1)

  call neobundle#untap()
endif

autocmd VimEnter * execute 'NERDTree'
autocmd QuickFixCmdPost *grep* cwindow

"Go
set runtimepath+=$GOROOT/misc/vim

let g:go_disable_autoinstall = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['go'] }
let g:syntastic_go_checkers = ['go', 'golint']

autocmd FileType go autocmd BufWritePre <buffer> Fmt
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview

"TypeScript
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
