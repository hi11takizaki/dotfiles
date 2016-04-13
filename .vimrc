" vi互換をOFF
set nocompatible

" エンコーディング
set encoding=utf-8  " デフォルトのエンコーディング
set fileencodings=sjis  " 自動判定するエンコーディング 

" 色の設定
autocmd ColorScheme * highlight Constant ctermfg=229
colorscheme lucius
set background=dark

" キーマップ
nnoremap O :<C-u>call append(expand('.'), '')<CR>j
noremap ; :
noremap <C-j> <esc>
inoremap <C-j> <esc>
nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sw <C-w>w
nnoremap t <Nop>
nnoremap tt :<C-u>tabnew<CR>
nnoremap tj gt
nnoremap tk gT
noremap j gj
noremap k gk
source $VIMRUNTIME/mswin.vim

" 表示関連
syntax on          " シンタックスカラーをON
set showmatch      " 括弧の対応をハイライト
set showcmd        " 入力中のコマンドを表示
set showmode       " モード表示
set number         " 行番号表示
set title          " 編集中のファイル名を表示
set ruler          " ルーラーの表示
set wrap           " 画面幅で折り返す
set list           " 不可視文字表示
set listchars=tab:>\ ,extends:<     " 不可視文字の表示方法
set guicursor=a:blinkon0            " カーソルを点滅させない
set notitle        " お礼を表示させない

" タブ周り
set tabstop=4       " Tab文字の幅
set softtabstop=0   " Tabキー押し下げ時の挿入される空白の量,0の場合はtabstopと同じ
set shiftwidth=4    " autoindent時に挿入されるインデントの幅
set smarttab        " 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set expandtab       " TABを空白に展開
set autoindent      " 自動インデント
set smartindent     " スマートインデント

" BackSpace設定
set backspace=indent,eol,start  " バックスペースでなんでも消せるように。eol:改行,start:入力モードに入る前の文字

" 検索関連
set wrapscan    " 最後まで検索したら先頭へ戻る
set ignorecase  " 大文字小文字無視
set incsearch   " インクリメンタルサーチ
set hlsearch    " 検索文字をハイライト

" バックアップファイルを作らない
set nobackup

" 折りたたみ設定
"set foldmethod=indent  " インデントで折りたたみ

" 行末のスペースを削除
"autocmd BufWritePre * :%s/\s\+$//ge

" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1

" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

if exists("g:did_load_filetypes")
    filetype off
    filetype plugin indent off
endif
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
