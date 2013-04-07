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

alias ls="ls -G"
alias ll="ls -l -G"
alias la="ls -la -G"

alias ctags="/usr/local/bin/ctags"
alias ctags-cpp="/usr/local/bin/ctags -R --c++-kinds=+pl --fields=+iaS"

alias nornir="haxelib run nornir"

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig/"

export RBENV_ROOT="/usr/local/var/rbenv"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source ~/.git-completion.bash
source ~/.tmuxinator/tmuxinator.bash
