set encoding=utf-8

set number

set lines=99999 columns=99999

" 自動生成ファイルの出力先を変更
set noswapfile
set undodir=~/.vim/.undo
set backupdir=~/.vim/.backup
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

" なんかすごいやつ
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

" ファイルのtree表示
NeoBundle 'scrooloose/nerdtree'


"インサートモードで開始
let g:unite_enable_start_insert=1
"ヒストリー/ヤンク機能を有効化
let g:unite_source_history_yank_enable =1
"prefix keyの設定
nmap <Space> [unite]

"スペースキーとpキーでカレントディレクトリを表示
nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=file file<CR>
"スペースキーとfキーでバッファと最近開いたファイル一覧を表示
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer file_mru<CR>
"スペースキーとdキーで最近開いたディレクトリを表示
nnoremap <silent> [unite]d :<C-u>Unite<Space>directory_mru<CR>
"スペースキーとbキーでバッファを表示
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
"スペースキーとrキーでレジストリを表示
nnoremap <silent> [unite]r :<C-u>Unite<Space>register<CR>
"スペースキーとtキーでタブを表示
nnoremap <silent> [unite]t :<C-u>Unite<Space>tab<CR>
"スペースキーとhキーでヒストリ/ヤンクを表示
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
"スペースキーとoキーでoutline
nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>
"スペースキーとENTERキーでfile_rec:!
nnoremap <silent> [unite]<CR> :<C-u>Unite<Space>file_rec:!<CR>
"unite.vimを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    " ESCでuniteを終了
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction"}}}


" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" シングルクオートとダブルクオートの入れ替え等
NeoBundle 'tpope/vim-surround'

" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" Ruby on Rails
NeoBundle 'tpope/vim-rails'

" CTRL+P
"NeoBundle 'ctrlpvim/ctrlp.vim'
"let g:ctrlp_cmd = 'CtrlPMixed'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


