export PATH=~/bin:~/Git/brew/bin:$PATH
export PATH=/usr/local/bin:$PATH

#PYTHONPATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5
#PYTHONPATH=${PYTHONPATH}:/opt/local/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5/site-packages
#PYTHONPATH=${PYTHONPATH}:/opt/local/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5/site-packages/gtk-2.0
#PYTHONPATH=${PYTHONPATH}:/Users/gavin/Desktop/Development/Mercurial/build-infra.hg/bsp/nfp-app-support.hg/py/module

#export PYTHONPATH

HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTSIZE=5000
setopt SHARE_HISTORY
setopt APPEND_HISTORY
# INC_APPEND_HISTORY makes two terminals get each other's history
# setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

#shopt -s cdspell

PS1='\t:\w:\!$ '

PS1="\[\033]0;\u@\h: \w\007\]bash\\$ "

# time : history : number : 
# PS1="\[\033]0;\W\007\]\\t:\!:\#:\w$ "
PROMPT="%B%F{blue}%*:%h:%~:%f%b$ "
HISTTIMEFORMAT='%T ' 

source $ZDOTDIR/aliases

# eval `opam config env`

export PATH="$HOME/.cargo/bin:$PATH"

#source "$HOME/.bash_iterm2"

#export LDFLAGS="-L/Users/gstark/Git/brew/opt/readline/lib"
#export CPPFLAGS="-I/Users/gstark/Git/brew/opt/readline/include"
#export PKG_CONFIG_PATH="/Users/gstark/Git/brew/opt/readline/lib/pkgconfig"
#export PATH="/Users/gstark/Git/rfpc-sw/install-rust/cargo/bin:$PATH"
