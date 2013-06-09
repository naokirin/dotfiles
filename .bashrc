##Java PATH setting
##Java6
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
##Java7
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.7.0.jdk/Contents/Home
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
alias gcc=/usr/local/bin/gcc-4.7
alias g++=/usr/local/bin/g++-4.7
alias gconv=/usr/local/bin/gcov-4.7
export CC="gcc"
export CXX="g++"
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

export QMAKESPEC="/usr/local/Cellar/qt/4.8.1/mkspecs/unsupported/macx-clang"

export HXCPP="/usr/lib/haxe/lib/hxcpp/2,10,1/"

alias munit="haxelib run munit"

export PATH=/Applications/gnuplot.app:/Applications/gnuplot.app/bin:$PATH

export RUBY_BIN=/usr/local/opt/ruby/bin

export PATH=$RUBY_BIN:$PATH

export OPAM_BIN=/Users/naoki/.opam/4.00.1/bin/
export PATH=$OPAM_BIN:$PATH

alias ls="ls -G"
alias ll="ls -l -G"
alias la="ls -la -G"
alias ctags-cpp="ctags -R --c++-kinds=+l"
