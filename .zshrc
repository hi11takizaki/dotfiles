autoload -Uz compinit promptinit colors
compinit
promptinit
colors

PROMPT="%{${fg[cyan]}%}%m[%T] %~
%(!.#.$) %{${reset_color}%}"

setopt COMPLETE_IN_WORD
setopt HIST_IGNORE_DUPS
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

export LANG=C
export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/sbin:/usr/sbin

alias ls='ls -Fh --time-style=long-iso'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
#alias vi='vim'
