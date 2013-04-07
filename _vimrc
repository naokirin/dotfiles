set fileencodings=utf-8
scriptencoding=utf-8

colorscheme desert
set nocompatible               " Be iMproved

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'szw/vim-tags'
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'taglist.vim'
NeoBundle 'jdonaldson/vaxe'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

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

command UniteOutline Unite -vertical -winwidth=30 outline

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

" -----  -----
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
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
    return "🔒"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⤴︎ '._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
