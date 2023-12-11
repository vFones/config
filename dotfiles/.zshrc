# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## SHELLS VARS
export TERM="xterm-256color"
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less --mouse"

## HISTORY VARS
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE

## LANG VARS
export LANG=it_IT.UTF-8

## ZSH VARS
ENABLE_CORRECTION="true"
HIST_STAMPS="dd.mm.yyyy"

# COMPLETITIONS
autoload -Uz promptinit && promptinit

## ENHANCD VARS
#ENHANCD_FILTER="fzy"
#ENHANCD_COMMAND="cd"
#ENHANCD_DISABLE_DOT=0

# OH-MY-ZSH VARS
# remember to remove in lib alias that dont want to be overwritten
DISABLE_LS_COLORS="true"

###############
##  ALIASES  ##
###############
alias q="exit"
alias vi="vim"
alias vimrc="vi ~/.vimrc"
alias vimconf="vi ~/.vimrc"
alias zshrc="vi ~/.zshrc"
alias zshconf="vi ~/.zshrc"
alias ls="exa --color=auto --icons"
alias sl="exa --color=auto --icons"
alias ll="exa -lh --color=auto --icons"
alias la="exa -lah --color=auto --icons"
alias ..="cd .."
alias ...="cd ../.."
alias nf="neofetch --bold off --block_range 0 7 --colors 4 6 8 3 5 7"
alias gitadog="git log --all --decorate --oneline --graph"
alias cat="batcat --paging=never"

###### ANTIDOTE Static loading
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load ~/.zsh_plugins

#compatibility before release 2.0 of antidote
zstyle ':antidote:compatibility-mode' 'antibody'
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

zstyle ':fzf-tab:*' continuous-trigger 'right'

_comp_options+=(globdots) # enable hidden files completion
zstyle ':completion:*' special-dirs false

# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
  '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN='|~/.lessfilter %s'

setopt complete_aliases
unsetopt correct_all  
setopt correct

if [ "$(uname -s)" = "Darwin" ]; then
  alias pip="pip3"
  if type brew &>/dev/null
    then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
  fi
else
  export PATH="$PATH:$HOME/.cargo/bin"
  export GOPATH="/usr/local/go"
  export PATH="$PATH:$GOPATH/bin"
  export PATH="$PATH:$HOME/.local/bin"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh