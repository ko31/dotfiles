" .vimrc
" 
" Ko Takagi <knockoutmarch@gmail.com>
" ===================================

" vim-plug Setting
" --------------
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'tomasr/molokai'
"Plug 'ZenCoding.vim'
Plug 'gtags.vim'
Plug 'YankRing.vim'
Plug 'scrooloose/nerdtree'
Plug 'mechatroner/rainbow_csv'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on


" 基本設定
" --------

set encoding=utf-8

let g:seoul256_background = 233
colorscheme seoul256
"colorscheme molokai


" 文字コード判別
" by ずんWiki - vim http://www.kawaz.jp/pukiwiki/?vim
" ---------------------------------------------------
if &encoding !=# 'utf-8'
	set encoding=japan
	set fileencoding=japan
endif
if has('iconv')
	let s:enc_euc = 'euc-jp'
	let s:enc_jis = 'iso-2022-jp'
	" iconvがeucJP-msに対応しているかをチェック
	if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'eucjp-ms'
		let s:enc_jis = 'iso-2022-jp-3'
	" iconvがJISX0213に対応しているかをチェック
	elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'euc-jisx0213'
		let s:enc_jis = 'iso-2022-jp-3'
	endif
	" fileencodingsを構築
	if &encoding ==# 'utf-8'
		let s:fileencodings_default = &fileencodings
		let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
		let &fileencodings = &fileencodings .','. s:fileencodings_default
		unlet s:fileencodings_default
	else
		let &fileencodings = &fileencodings .','. s:enc_jis
		set fileencodings+=utf-8,ucs-2le,ucs-2
		if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
			set fileencodings+=cp932
			set fileencodings-=euc-jp
			set fileencodings-=euc-jisx0213
			set fileencodings-=eucjp-ms
			let &encoding = s:enc_euc
			let &fileencoding = s:enc_euc
		else
			let &fileencodings = &fileencodings .','. s:enc_euc
		endif
	endif
	" 定数を処分
	unlet s:enc_euc
	unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
	function! AU_ReCheck_FENC()
		if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
			let &fileencoding=&encoding
		endif
	endfunction
	autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
	set ambiwidth=double
endif


" 編集関連
" --------

"オートインデントする
set autoindent

"クリップボード
set clipboard+=unnamed


" 検索関連
" --------

"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
"検索時に最後まで行ったら最初に戻る
set wrapscan
"検索文字列入力時に順次対象文字列にヒットさせない
set noincsearch


" 装飾関連
" --------

"シンタックスハイライトを有効にする
if has("syntax")
	syntax on
endif
"行番号を表示
set number
"タブの左側にカーソル表示
set listchars=tab:\ \ 
set list
"タブ幅を設定する
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"入力中のコマンドをステータスに表示する
set showcmd
"括弧入力時の対応する括弧を表示
set showmatch
"検索結果文字列のハイライトを有効にする
set hlsearch
"ステータスラインを常に表示
set laststatus=2
"ステータスライン表示フォーマット
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]


" マップ定義
" ----------

noremap j gj
noremap k gk
noremap gj j
noremap gk k


" プラグイン関連
" --------------

" ### zencoding
let g:user_zen_expandabbr_key = '<c-z>'

" ### gtags
" Grep
nnoremap <C-g> :Gtags -g
" 開いているファイルの関数一覧                                                                                                                                                
nnoremap <C-l> :Gtags -f %<CR>
" カーソル位置の定義元を探す
nnoremap <C-j> :Gtags <C-r><C-w><CR>
" カーソル位置の使用箇所を探す
nnoremap <C-k> :Gtags -r <C-r><C-w><CR>
" 次の検索結果へ
nnoremap <C-n> :cn<CR>
" 前の検索結果へ
nnoremap <C-p> :cp<CR>

" ### ctags
":set tags=/path/to/tags


" 言語関連
" --------

" ### PHP

"autocmd FileType php :set dictionary=~/.vim/dict/php.dict
"autocmd BufNewFile *.php 0r ~/.vim/template/skeleton.php


" ### Python

"filetype plugin on
"autocmd FileType python let g:pydiction_location = '~/vim/pydiction/complete-dict
"autocmd FileType python setl autoindent
"autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"autocmd FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4

