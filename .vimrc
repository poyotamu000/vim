

"""""""""""""""""""""""
""    NeoBundle       "
"""""""""""""""""""""""
"
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc',{
            \'build':{
            \'windows':'make -f make_mingw32.mak',
            \'cygwin':'make -f make_cygwin.mak',
            \'mac':'make -f make_mac.mak',
            \'unix':'make -f make_unix.mak',
            \},
            \}
NeoBundleCheck


"""""""""""""""""""""
"    plugin         "
"""""""""""""""""""""

"GitHubリポジトリにあるプラグインを利用する
" --> NeoBundle 'USER/REPOSITORY-NAME'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'davidoc/taskpaper.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'vimtaku/hl_matchit.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'rhysd/vim-clang-format'
NeoBundle 'davidhalter/jedi-vim'
"NeoBundle 'scrooloose/syntastic'

"ruby
NeoBundle 'marcus/rsense'
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
NeoBundle 'szw/vim-tags'
NeoBundle 'tpope/vim-endwise'

"html
NeoBundle 'surround.vim'

"colorscheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'vim-scripts/rdark'


call neobundle#end()

"""""""""""""""""""""
"    基本設定       "
"""""""""""""""""""""

"viとの互換を切る
set nocompatible
"行番号を表示
set number
"行を超えて移動可能
set whichwrap+=h,l
"シンタックスハイライト
syntax on
"swapファイルを作らない
set noswapfile
"バックアップを作らない
set nowritebackup
"エンコード
set encoding=utf8
"ファイルエンコード
set fileencoding=utf-8
"文字がないところでもカーソル移動を可能にする
set virtualedit=all
"おまじない
filetype on
filetype plugin on
filetype indent on
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set smarttab
"オートインデント
set autoindent
"インクリメンタルサーチができるようにする
set incsearch
"検索結果をハイライト表示
set hlsearch
"検索時の大文字小文字の区別をなくす
set ignorecase 
"検索時大文字が入ったときのみignorecase無効
set smartcase 
"backspaceでインデント消したり
set backspace=indent,eol,start
"OSのクリップボードを使う
set clipboard=unnamedplus,autoselect
"対応する括弧をハイライト表示
set showmatch
"0.3secのみ
set matchtime=1
"コマンドライン補完候補をだす
set wildmenu
"emacs仕様化
:map! <C-e> <Esc>$
:map! <C-a> <Esc>^
:map <C-e> <Esc>$
:map <C-a> <Esc>^
"gtagsの設定
map <C-g> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
"colorschemeの設定
"terminalを256色対応にする
set t_Co=256
if has("gui_running")
    colorscheme molokai
else
    colorscheme molokai
end
"vim用のハイライトを非表示にする
let g:tex_conceal = ''

""""""""neocomplcache""""""""
"Disable AutoComplPop.
let g:acp_enableAtStartup = 0
"Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
"Use smartcase.
let g:neocomplcache_enable_smart_case = 1
"Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

"Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : ''
            \ }

"rsense
let g:rsenseUseOmniFunc = 1

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
" " Recommended key-mappings.
" " <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()

""""""""neosnippet""""""""
" Plugin key-mappings.
" imap <C-k>  <Plug>(neosnippet_expand_or_jump)
" smap <C-k>  <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>  <Plug>(neosnippet_expand_target)
"
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

"""""""""Octave syntax"""""""""""
augroup filetypedetect
    au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

nnoremap <F5> :e ~/.vimrc<CR>
nnoremap <C-z> :NERDTreeToggle<CR>

"""""""""""タブ、空白、改行の可視化"""""""""
set list
set listchars=tab:>_,trail:_,extends:>,precedes:<,nbsp:%
"vim-indent-guides
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=236
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size=1
" 括弧のハイライト？
let loaded_matchparen = 1
"
if has("path_extra")
    set tags+=tags;
endif
"autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp :ClangFormat
"autocmd BufWrite,FileWritePre,FileAppendPre *.[ch] :ClangFormat
"autocmd BufWrite,FileWritePre,FileAppendPre *.cc :ClangFormat
let g:lisp_rainbow=1
let g:lisp_instring=1
autocmd BufNewFile,BufRead *.l set tabstop=2 shiftwidth=2 lisp showmatch nocindent filetype=lisp
autocmd BufNewFile,BufRead *.[ch] set tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.[ch]pp set tabstop=4 shiftwidth=4
"autocmd BufNewFile,BufRead *.l colorscheme jellybeans
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.launch set filetype=xml

"rubocop
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
"let g:syntastic_ruby_checkers = ['rubocop']

" let g:syntastic_python_checkers = ['pyflakes', 'pep8']

" original http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction

" C-p で自動修正
autocmd FileType python nnoremap <C-p> :call Autopep8()<CR>
