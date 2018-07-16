set fileencodings=utf-8
scriptencoding=utf-8

filetype plugin indent off

colorscheme desert

if !has('gui_running')
  set notimeout
  set ttimeout
  set timeoutlen=100
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible  " Be iMproved
endif

" Required:
set runtimepath+=/Users/naoki/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/naoki/.cache/dein')
  call dein#begin('/Users/naoki/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/naoki/.cache/dein/repos/github.com/Shougo/dein.vim')

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

" ----- [End] Basic settings -----

" ----- [Start] autocmd file settings -----

autocmd BufNew,BufRead * highlight cComment ctermfg=lightblue guifg=lightblue
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd BufNewFile,BufRead *.rb,*.haml,*.erb,*.slim set nowrap tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.cpp,*.h,*.hpp,*.cc set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.rs set nowrap expandtab tabstop=4 shiftwidth=4

" ----- [End] autocmd file settings -----

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

" ----- [Start] vim-altercmd -----

call altercmd#load()

" ----- [End] vim-altercmd -----

set noswapfile
set hlsearch
filetype plugin indent on     " Required!
