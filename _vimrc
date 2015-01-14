set fileencodings=utf-8
scriptencoding=utf-8

colorscheme desert
set nocompatible               " Be iMproved

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
      \    'build' : {
      \        'mac'  : 'make -f make_mac.mak',
      \        'unix' : 'make -f make_unix.mak',
      \        }
      \    }
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'szw/vim-tags'
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'taglist.vim'
NeoBundle 'jdonaldson/vaxe'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'basyura/unite-rails'
NeoBundle 'tpope/vim-rails'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'dbext.vim'
NeoBundle 'bbatsov/rubocop'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'rhysd/vim-clang-format'
NeoBundle "thinca/vim-quickrun"
NeoBundle "osyo-manga/shabadou.vim"
NeoBundle "osyo-manga/vim-watchdogs"
NeoBundle "jceb/vim-hier"
NeoBundle "yonchu/quickfixstatus"
NeoBundle 'tyru/vim-altercmd'

" :WatchdogsRun後にlightline.vimを更新
let g:Qfstatusline#UpdateCmd = function('lightline#update')

NeoBundle "KazuakiM/vim-qfstatusline"

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" ----- vim-altercmd -----
call altercmd#load()


set completeopt=menuone
let g:neocomplcache_clang_use_library  = 1

let g:neocomplcache_clang_library_path = '/usr/local/lib/'
let g:neocomplcache_clang_user_options =
          \ '-I /usr/local/include/v1/ '.
          \ '-I /usr/local/include/ '.
          \ '-fms-extensions -fgnu-runtime '.
          \ '-include malloc.h '
let g:neocomplcache_max_list=1000
let g:clang_user_options  = '2>/dev/null || exit 0"'


" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" " Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" " Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" " Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_force_overwrite_completefunc=1
"
" " Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
\ 'default' : '',
\ 'vimshell' : $HOME.'/.vimshell_hist',
\ 'scheme' : $HOME.'/.gosh_completions'
\ }
"
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim. 
if !exists('g:neocomplcache_omni_patterns')
let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

let g:clang_complete_auto =1


set backspace=indent,eol,start
set nocompatible

"set clipboard+=unnamed,autoselect
set expandtab
set number
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set nobackup
set backupcopy=no

imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>

inoremap <silent> <ESC> <ESC>
inoremap <silent> <C-[> <ESC>

" ***** タブ操作の設定 *****
nnoremap    [Tab]               <Nop>
nmap        <C-t>               [Tab]
nnoremap    <silent> [Tab]n     :<C-u>tabnew<CR>
nnoremap    <silent> [Tab]c     :<C-u>tabclose<CR>
nnoremap    <silent> [Tab]o     :<C-u>tabonly<CR>
nnoremap    [Tab]j              gt
nnoremap    [Tab]k              gT
" <C-Tab>にもタブ切り替えを割り当て
nnoremap    <C-Tab>   gT
nnoremap    <Tab>       gt

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ


" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
  syntax on

  " PODバグ対策
    syn sync fromstart

  function! ActivateInvisibleIndicator()
    syntax match InvisibleUnicodeSpace "\u3000" display containedin=ALL
    highlight InvisibleUnicodeSpace term=underline ctermbg=Blue guibg=magenta gui=underline guisp=magenta
    syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
    highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=lightmagenta gui=undercurl guisp=lightmagenta
    syntax match InvisibleTab "\t" display containedin=ALL
    highlight InvisibleTab term=underline ctermbg=white gui=undercurl
  endf
  augroup invisible
    autocmd! invisible
    autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
  augroup END
endif

autocmd BufNew,BufRead * highlight cComment ctermfg=lightblue guifg=lightblue

set showtabline=2

map :coqstart :CoqStart
map :coqgoto :CoqGoto

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <silent> <C-]> g<C-]>

if has('path_extra')
    set tags+=tags;/Users/naoki/;/usr/local/Cellar/gcc48/4.8.1/gcc/include/c++/;/usr/local/Cellar/boost/1.53.0/include/
endif

let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_Show_one_File = 1
let Tlist_Exit_OnlyWindow = 1
map <silent> <leader>tl :TlistToggle<CR>

let g:vim_tags_auto_generate = 1
let vim_tags_project_tags_command="/usr/local/bin/ctags -R --c++-kinds=+pl {OPTIONS} {DIRECTORY} 2>/dev/null"

" ------ git now ------
command! Now :!git-now
nnoremap <silent> <C-n> :Now

" -----  yanktmp.vim ------
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

" ----- vim-fugitive -----
"command-line completion
set wildmenu
set wildmode=list:longest

" ----- lightline -----
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ],
      \   'right':[ [ 'syntaxcheck' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' },
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'component_expand': {
      \   'syntaxcheck': 'qfstatusline#Update',
      \ },
      \ 'component_type': {
      \   'syntaxcheck': 'error',
      \ },
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "🔒 "
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '|⤴︎ '._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

" ----- unite.vim -----
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,url :<C-u>Unite -vertical -winwidth=30 rails/

command UniteOutline Unite -vertical -winwidth=30 outline
nnoremap <silent> ,uo :<C-u>UniteOutline<CR>

" ----- vaxe -----
"set autogroup
augroup MyAutoCmd
  autocmd!
augroup END

" vaxeの動作にはautowriteを有効にする必要がある
autocmd MyAutoCmd FileType haxe
      \ setl autowrite
autocmd MyAutoCmd FileType hxml
      \ setl autowrite
autocmd MyAutoCmd FileType nmml.xml
      \ setl autowrite

let g:vaxe_haxe_version = 3

function! s:init_vaxe_keymap()
  " .hxmlファイルを開いてくれる
  nnoremap <buffer> ,vo :<C-u>call vaxe#OpenHxml()<CR>
  " タグファイル作ってくれる
  nnoremap <buffer> ,vc :<C-u>call vaxe#Ctags()<CR>
  " 自動インポート
  nnoremap <buffer> ,vi :<C-u>call vaxe#ImportClass()<CR>
endfunction

autocmd MyAutoCmd FileType haxe call s:init_vaxe_keymap()
autocmd MyAutoCmd FileType hxml call s:init_vaxe_keymap()
autocmd MyAutoCmd FileType nmml.xml call s:init_vaxe_keymap()

" 以下はNeocomplete用
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.haxe = '\v([\]''"\)]|\w|(^\s*))(\.|\()'

" ----- syntastic -----
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_mode_map = { 'mode': 'passive' }
nnoremap ,s :SyntasticCheck<CR>
nnoremap ,es :Errors<CR>

" ----- vim-clang-format -----
map ,x :ClangFormat<CR>

" ----- watchdogs -----
let g:quickrun_config = {
      \   "watchdogs_checker/_" : {
      \       "hook/u_nya_/enable" : 1,
      \       "hook/inu/enable" : 0,
      \       "hook/unite_quickfix/enable" : 0,
      \       "hook/echo/enable" : 1,
      \       "hook/back_buffer/enable" : 0,
      \       "hook/close_unite_quickfix/enable" : 0,
      \       "hook/close_buffer/enable_exit" : 0,
      \       "hook/close_quickfix/enable_exit" : 1,
      \       "hook/redraw_unite_quickfix/enable_exit" : 0,
      \       "hook/close_unite_quickfix/enable_exit" : 1,
      \       "hook/echo/output_success": "> No Errors Found.",
      \   },
      \
      \   "cpp/watchdogs_checker" : {
      \       "hook/add_include_option/enable" : 1,
      \       "type" : "watchdogs_checker/g++",
      \   },
      \
      \   "watchdogs_checker/g++" : {
      \       "cmdopt" : "-std=c++0x -Wall",
      \   },
      \
      \   "watchdogs_checker/clang++" : {
      \       "cmdopt" : "-std=c++0x -Wall",
      \   },
      \   "ruby/watchdogs_checker" : {
      \       "type" : "watchdogs_checker/rubocop"
      \   }
      \}

" watchdogsのフックを設定
let g:quickrun_config["watchdogs_checker/_"] = {
      \ "outputter/quickfix/open_cmd" : "",
      \ "hook/qfstatusline_update/enable_exit" : 1,
      \ "hook/qfstatusline_update/priority_exit" : 4,
      \ }

call watchdogs#setup(g:quickrun_config)

nnoremap ,w :WatchdogsRun<CR>

" ----- vim-rails -----
autocmd User Rails AlterCommand r R
autocmd User Rails AlterCommand rc Rcontroller
autocmd User Rails AlterCommand rm Rmodel
autocmd User Rails AlterCommand rv Rview
