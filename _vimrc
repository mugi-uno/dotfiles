set encoding=utf-8

" ハイライト有効化
syntax enable
syntax on

" 行表示
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

" configure to move cursor on insert mode
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
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

" indent highlight
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1


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

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" key binding for NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Easy Motion(なんかすごい感じでカーソル移動するやつ)
NeoBundle 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0  "Disable default mappings
let g:EasyMotion_smartcase = 1   "大文字小文字マッチ
nmap s <Plug>(easymotion-bd-w)

" Linter
NeoBundle 'Shougo/vimproc.vim', {'do' : 'make'}
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'osyo-manga/vim-watchdogs'

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


let g:ctrlp_cmd = 'CtrlPMixed'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png
let g:ctrp_custom_ignore='\v[\/](node_modules|build)$'

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

" ファイルタイプと実行するコマンドのひも付け（javascriptでeslint実行するよー）
if executable('eslint')
  let g:quickrun_config['javascript/watchdogs_checker'] = {
        \   'type' : 'watchdogs_checker/eslint',
        \ }
  let g:quickrun_config['javascript.jsx/watchdogs_checker'] = {
        \   'type' : 'eslint',
        \ }
endif
" 次のファイルタイプのバッファが保存されたらwatch-dogsがquick-run走らせてくれる
let g:watchdogs_check_BufWritePost_enables = {
      \ 'javascript'     : 1,
      \ 'javascript.jsx' : 1,
      \ }

call neobundle#end()


