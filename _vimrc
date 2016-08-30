set encoding=utf-8

" USキーボード用vimrcが存在する場合は読み込む
if filereadable(glob("~/.vimrc.us"))
  source ~/.vimrc.us
endif

" ハイライト有効化
syntax enable
syntax on

" 行表示
set number

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
set whichwrap=b,s,h,l,<,>,[,]
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

" use / on Windows
set shellslash

" ESCがつらい
noremap <C-j> <esc>
noremap! <C-j> <esc>

" タブ変更がつらい
noremap <Tab> gt
noremap <C-Tab> gT

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

" theme
NeoBundle 'chriskempson/vim-tomorrow-theme' 

" マルチカーソル
NeoBundle 'terryma/vim-multiple-cursors'

" indent guide
" NeoBundle 'Yggdroot/indentLine'
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
" let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']


" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" シングルクオートとダブルクオートの入れ替え等
NeoBundle 'tpope/vim-surround'

" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" Ruby on Rails
NeoBundle 'tpope/vim-rails'
" slim template
NeoBundle 'slim-template/vim-slim'



"" ES6 highlight
NeoBundle 'othree/yajs.vim'
"" stage-0 syntax highlight
NeoBundle 'othree/es.next.syntax.vim'
"" jsx highlight
NeoBundle 'mxw/vim-jsx'

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" key binding for NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Easy Motion(なんかすごい感じでカーソル移動するやつ)
NeoBundle 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0  "Disable default mappings
let g:EasyMotion_smartcase = 1   "大文字小文字マッチ
nmap s <Plug>(easymotion-bd-w)

" ステータスバーをいい感じにする
NeoBundle 'itchyny/lightline.vim'
set nocursorline                                      " カーソル行の強調解除
autocmd InsertEnter,InsertLeave * set cursorline!     " 挿入モード時にカーソル強調

" Required:
" filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" CTRL+P
NeoBundle 'ctrlpvim/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png
let g:ctrlp_custom_ignore = '\v[\/](node_modules|build)$'
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config['watchdogs_checker/_'] = {
        \   'runner' : 'vimproc',
        \   'runner/vimproc/sleep' : 10,
        \   'runner/vimproc/updatetime' : 500,
        \   'outputter/buffer/split' : ':botright 4sp',
        \   'outputter/quickfix/open_cmd' : "",
        \   'hook/echo/enable' : 0,
        \   'hook/echo/output_success': '> No Errors Found.',
        \   'hook/back_window/enable' : 1,
        \   'hook/back_window/enable_exit' : 1,
        \   'hock/close_buffer/enable_hock_loaded' : 1,
        \   'hock/close_buffer/enable_success' : 1,
        \   'hook/qfstatusline_update/enable_exit' : 1,
        \   'hook/qfstatusline_update/priority_exit' : 4,
        \ }

call neobundle#end()

