# set command stored 
HISTSIZE=500

# set notify
setopt notify

# set nobeep
unsetopt beep

# use emace bindkey
bindkey -v

# about commpletion
zstyle :compinstall filename '/home/kujou/.zshrc'
autoload -Uz compinit promptinit
compinit
promptinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1

## access to the directory you recently opened
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus

# source some plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# set prompt
PROMPT='%F{red}%n%F{cyan}@%F{blue}%T %F{green}%~ %F{cyan}> %f'
# PROMPT='%F{blue}%T %F{green}%~ %F{cyan}> %f'
RPROMPT='%F{cyan}[%F{yellow}%?%F{cyan}]%f'

# some alias
alias vi=vim
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -ah --color=auto'
alias sudo='sudo '
alias -s c=vim
alias -s cpp=vim
alias -s sh=vim
alias cat=bat
alias top=htop
alias grep='grep --color=auto -n'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias catip='curl cip.cc'
alias setproxy='export all_proxy=socks5://127.0.0.1:1080'
alias unsetproxy='unset all_proxy'
alias ra='ranger'

