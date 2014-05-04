# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
setopt print_eight_bit
setopt magic_equal_subst
setopt list_types
setopt nolistbeep

bindkey -a >/dev/null 2>&1
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/naoki/.zshrc'

autoload -Uz compinit
compinit

setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
setopt auto_param_slash
setopt mark_dirs
setopt list_packed
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*:default' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
zstyle ':completion:*:default' menu select=1 # 補完候補のカーソル選択を有効に

# End of lines added by compinstall

autoload colors
colors

# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;3'
# export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# # ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS

# https://github.com/seebi/dircolors-solarized
# ln -s dircolors-sorlarized/dircolors.ansi-universal ~/.dircolors
if [ -f ~/.dircolors ]; then
    if type dircolors > /dev/null 2>&1; then
        eval $(dircolors ~/.dircolors)
    elif type gdircolors > /dev/null 2>&1; then
        eval $(gdircolors ~/.dircolors)
    fi
fi

# # 補完候補に色を付ける
if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

PROMPT="[%n:%{${fg[yellow]}%}%(5~,%-2~/.../%2~,%~)%{${reset_color}%}]$ "
PROMPT2='[%n]> '

[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux


##Java PATH setting
##Java6
##export JAVA_HOME=`readlink /usr/libexec/java_home`
##Java7
export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.7.0.jdk/Contents/Home
export JUNIT_HOME=/Users/naoki/Application/junit4.10
export SPOCK_HOME=/Users/naoki/Application/spock
export GROOVY_HOME=/usr/local/Cellar/groovy/2.0.4/libexec/
export CLASSPATH="{CLASS_PATH}:$JUNIT_HOME/junit.jar:$SPOCK_HOME/spock-core0.7-groovy-2.0.jar"

export PYTHON_HOME=/usr/bin/python2.7/

# MacPorts Installer addition on 2012-05-06_at_23:51:39: adding an appropriate PATH variable for use with MacPorts.
export PATH=/Users/naoki/shell:/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

alias coqide="open /Applications/CoqIdE_8.3pl3.app"

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
#export CC="clang"
#export CXX="clang++ -stdlib=libc++ -std=c++0x"
alias gcc=/usr/local/bin/gcc-4.8
alias g++=/usr/local/bin/g++-4.8
alias gconv=/usr/local/bin/gcov-4.8
export CC="gcc-4.8"
export CXX="g++-4.8"
export cc1plus="g++-4.8"
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

export QMAKESPEC="/usr/local/Cellar/qt/4.8.1/mkspecs/unsupported/macx-clang"

export HXCPP="/usr/lib/haxe/lib/hxcpp/3,0,3-beta"

alias munit="haxelib run munit"

export PATH=/Applications/gnuplot.app:/Applications/gnuplot.app/bin:$PATH

export RUBY_BIN=/usr/local/opt/ruby/bin

export PATH=$RUBY_BIN:$PATH

export OPAM_BIN=/Users/naoki/.opam/4.00.1/bin
export PATH=$OPAM_BIN:$PATH

# If Mac OS X, brew install coreutils
alias ls="/usr/local/bin/gls --color=auto"
alias ll="/usr/local/bin/gls -l --color=auto"
alias la="/usr/local/bin/gls -la --color=auto"

alias ctags="/usr/local/bin/ctags"
alias ctags-cpp="/usr/local/bin/ctags -R --c++-kinds=+pl --fields=+iaS"

alias nornir="haxelib run nornir"

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig/"

export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u
