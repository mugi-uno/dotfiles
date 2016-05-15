set encoding=utf-8

syntax on
set number

colorscheme desert

" 自動生成ファイルの出力先を変更
set noswapfile
set undodir=~/.vim/.undo
set nobackup
set viminfo+=n~/.vim/_viminfo

" BSキーによる削除対象を拡張
set backspace=indent,eol,start

" 現在のカーソル位置を画面右下に常時表示
set ruler

" ウィンドウのタイトルバーにファイルのパス情報を表示
set title

" 入力途中のコマンドを表示
set showcmd

" 画面端での行折り曲げを禁止
set nowrap

" 画面端でのカーソル移動を許可
set whichwrap=b,s,<,>,[,]

" 未保存でも他ファイルを開けるように
set hidden

" インクリメンタルサーチ
set incsearch

" 未保存でも他ファイルを開けるように
set hidden

" タブ幅とインデントの設定
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2

" view white space
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" マルチカーソル
NeoBundle 'terryma/vim-multiple-cursors'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" シングルクオートとダブルクオートの入れ替え等
NeoBundle 'tpope/vim-surround'

" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" Ruby on Rails
NeoBundle 'tpope/vim-rails'


"" ES6 highlight
NeoBundle 'othree/yajs.vim'
"" stage-0 syntax highlight
NeoBundle 'othree/es.next.syntax.vim'
"" jsx highlight
NeoBundle 'mxw/vim-jsx'


" CTRL+P
NeoBundle 'ctrlpvim/ctrlp.vim'
let g:ctrlp_cmd = 'CtrlPMixed'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


