set fileencodings=utf-8
scriptencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

filetype plugin indent off

colorscheme desert

if !has('gui_running')
  set notimeout
  set ttimeout
  set timeoutlen=10
  set timeoutlen=10
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible  " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.config/nvim')

  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

if has('nvim')
  let g:python_host_prog  = '/usr/local/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
  let g:ruby_host_prog = '~/.rbenv/shims/ruby'
endif

" ----- [Start] Basic settings -----

set backspace=indent,eol,start

"set clipboard+=unnamed,autoselect
set expandtab
set number
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set nobackup
set backupcopy=no

inoremap <silent> <ESC> <ESC>
inoremap <silent> <C-[> <ESC>

" タブ操作の設定
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

set showtabline=2 " 常にタブラインを表示

" ターミナルでもESCでコマンドモードにする
tnoremap <silent> <ESC> <C-\><C-n>

" ----- [End] Basic settings -----

" ----- [Start] vim-altercmd -----

call altercmd#load()

" ----- [End] vim-altercmd -----

" ----- [Start] autocmd file settings -----

autocmd BufNew,BufRead * highlight cComment ctermfg=lightblue guifg=lightblue
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd BufNewFile,BufRead *.rb,*.haml,*.erb,*.slim set nowrap tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.cpp,*.h,*.hpp,*.cc set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.rs set nowrap expandtab tabstop=4 shiftwidth=4
autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
autocmd Filetype vue inoremap <buffer> </ </<C-x><C-o>

" ----- [End] autocmd file settings -----

" ----- [Start] deoplete.vim -----

let g:deoplete#enable_at_startup = 1

" ----- [End] deoplete.vim -----

" ----- [Start] lightline -----

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ],
      \ },
      \ 'component_function': {
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' },
      \ 'mode_map': {'c': 'NORMAL'},
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
    return "#"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
      \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
      \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

set laststatus=2

" ----- [End] lightline -----

" ----- [Start] vim-nerdtree-tabs -----

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1
let NERDTreeWinSize=40
let NERDTreeIgnore = ['\.gch']
let NERDTreeShowHidden=1

let mapleader = '\'

" ----- [End] vim-nerdtree-tabs -----

" ----- [Start] vim-altr -----

call altr#define('%.h', '%.c')
call altr#define('%.h', '%.cpp')
call altr#define('%.hpp', '%.cpp')

nmap <Leader>a <Plug>(altr-forward)
nmap <Leader>f :call OpenNewTab()<CR> <Plug>(altr-forward)<CR>
function! OpenNewTab()
  let f = expand("%:p")
  execute ":tabnew ".f
endfunction

" ----- [End] vim-altr -----

" ----- [Start] CamelCaseMotion -----

map <Bslash> w <Plug>CamelCaseMotion_w
map <Bslash> b <Plug>CamelCaseMotion_b
map <Bslash> e <Plug>CamelCaseMotion_e

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e

sunmap w
sunmap b
sunmap e

" ----- [End] CamelCaseMotion -----

" ----- [Start] vim-indet-guides -----

let g:indent_guides_enable_on_vim_startup = 1

" ----- [End] vim-indent-guides -----

" ----- [Start] ale -----

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}

" ----- [End] ale -----

" ----- [Start] neosnippet.vim -----

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" ----- [End] neosnippet.vim -----

hi SpellBad cterm=NONE ctermfg=white ctermbg=darkred

set noswapfile
set hlsearch

set fillchars+=vert:\|

filetype plugin indent on     " Required!
