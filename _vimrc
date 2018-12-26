"以下はすべて独自設定であり、_vimrcをvimrcと同じディレクトリに置けばよい
"ari23ant181226


"---dein.vim設定---
"以下はdein.vimを入れるための記述
if &compatible
  set nocompatible
endif

"dein.vimディレクトリをruntimepathに追加する
set runtimepath+=~/vimfiles/bundles/repos/github.com/Shougo/dein.vim

"以下定型文
if dein#load_state("~/vimfiles/bundles")
  call dein#begin("~/vimfiles/bundles")
    call dein#add("~/vimfiles/bundles/repos/github.com/Shougo/dein.vim")
    
      "好きなプラグインを dein#add() 追加していく
      "call dein#add('好きなプラグイン')
      "call dein#add('vim-airline/vim-airline')

	  "markdown形式用プラグイン
      call dein#add('plasticboy/vim-markdown')
      call dein#add('kannokanno/previm')
      call dein#add('tyru/open-browser.vim')

	  "はてなブログ用プラグイン
	  call dein#add('mattn/webapi-vim')
	  call dein#add('Shougo/unite.vim')
	  call dein#add('moznion/hateblo.vim')

    call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
"---dein.vim設定ここまで---


"---markdown用プラグイン設定---
" plasticboy/vim-markdown
" 折りたたみの禁止
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" kannokanno/previm
autocmd BufRead,BufNewFile *.md set filetype=markdown
"let g:previm_open_cmd = 'open -a Firefox'
let g:previm_open_cmd = 'C:\\Program\ Files\ (x86)\\Mozilla\ Firefox\\firefox.exe'
" ctrl pでプレビュー
nnoremap <silent> <C-p> :PrevimOpen<CR>

" tyru/open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
"---markdown用プラグイン設定ここまで---


""Plugin
"プラグインを読み込む場合はここに記述する。
"dein.vimならここには書かない
  


""Encode
"下記の指定は環境によって文字化けする可能性があるので適宜変更する
set encoding=UTF-8     "文字コードをUTF-8にする
set fileencoding=UTF-8 "文字コードをUTF-8にする
set termencoding=UTF-8 "文字コードをUTF-8にする


""File
set hidden    "ファイル変更中でも他のファイルを開けるようにする
set autoread  "ファイル内容が変更されると自動読み込みする


""Backup
"set backupdir=$HOME/.vim/backup    "バックアップディレクトリを指定する
"set browsedir=buffer    "ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
"set directory=$HOME/.vim/backup,c:\temp    "スワップファイルディレクトリを指定する
"上記3行はコメントアウトari181220
set history=1000  "履歴保存数
set noswapfile    " .swpファイル作成無効
set nobackup      "~ファイル作成無効
set noundofile    " .un~ファイル作成無効


""Search
set incsearch    "インクリメンタルサーチを行う
set hlsearch     "検索結果をハイライトする
set ignorecase   "検索時に文字の大小を区別しない
set smartcase    "検索時に大文字を含んでいたら大小を区別する
set wrapscan     "検索をファイルの先頭へループする


""Input
set cindent       "C言語のインデントに従って自動インデントを行う
set shiftwidth=4  "行頭での<Tab>の幅
set tabstop=4     "行頭以外での<Tab>の幅
"set expandtab      "<Tab>の代わりに<Space>を挿入する
"set softtabstop=4  "expandtabで<Tab>が対応する<Space>の数
set backspace=indent,eol,start  "BackSpce機能を使えるようにする
set whichwrap=b,s,h,l,<,>,[,]   "カーソルを行頭、行末で止まらないようにする
set clipboard=unnamed           "クリップボードを利用する


"" 挿入モード中に'Ctr-*'でコマンドモードでの移動を可能にする
"inoremap <C-h> <right>   "カーソルを右へ
"inoremap <C-l> <left>    "カーソルを左へ
"inoremap <C-j> <down>    "カーソルを下へ
"inoremap <C-k> <up>      "カーソルを上へ


"" 空白文字を表示
set list                      "タブ、行末等の不可視文字を表示する
set listchars=tab:>-,trail:_  "タブと行末に続くスペースを表示する
scriptencoding utf-8          "おまじない これがないと下記が反映されない
augroup highlightZenkakuSpace "全角スペースを赤色にする
  autocmd!
  "autocmd VimEnter,ColorScheme * highlight ZenkakuSpace term=underline ctermbg=Red guibg=Red
  autocmd VimEnter,ColorScheme * highlight ZenkakuSpace term=underline ctermbg=Red
  autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
augroup END

"" dein.vimのプラグインを入れたら、gvimが文字化けしたため、以下対処
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim
