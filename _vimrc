set encoding=utf-8

set number

set lines=99999 columns=99999

" BSキーによる削除対象を拡張
set backspace=indent,eol,start

" 自動インデント
set autoindent

" 現在のカーソル位置を画面右下に常時表示
set ruler

" 入力途中のコマンドを表示
set showcmd

" 画面端での行折り曲げを禁止
set nowrap

" 画面端でのカーソル移動を許可
set whichwrap=b,s,<,>,[,]

" インクリメンタルサーチ
set incsearch

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

" なんかすごいやつ
NeoBundle 'Shougo/unite.vim'

" ファイルのtree表示
NeoBundle 'scrooloose/nerdtree'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


