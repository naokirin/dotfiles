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
setopt hist_ignore_all_dups # 重複するコマンドは古い方を削除する
setopt extended_history     # 履歴ファイルに時刻を記録する
setopt HIST_IGNORE_ALL_DUPS # 履歴中の重複行をファイル記録前に無くす

source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

zmodload zsh/terminfo
# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -a >/dev/null 2>&1
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

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

export JAVA_HOME=`/usr/libexec/java_home`

export PATH=$PATH:$JAVA_HOME/bin
export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH

# If Mac OS X, brew install coreutils
alias ls="/usr/local/bin/gls --color=auto"
alias ll="/usr/local/bin/gls -l --color=auto"
alias la="/usr/local/bin/gls -la --color=auto"

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/naoki/.sdkman"
[[ -s "/Users/naoki/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/naoki/.sdkman/bin/sdkman-init.sh"
