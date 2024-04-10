export MOZ_DBUS_REMOTE=1
export GPG_TTY=$(tty)

if [ "$TERM" = linux ] && command -v ttyscheme >/dev/null; then
  ttyscheme gruvbox_dark
fi

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

## ZSH VARS
ENABLE_CORRECTION="true"
HIST_STAMPS="dd.mm.yyyy"

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
alias fzf='SHELL=bash fzf'
alias bat='batcat'
alias cat='batcat -p'

###### ANTIDOTE Static loading
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load ~/.zsh_plugins
#compatibility before release 2.0 of antidote
zstyle ':antidote:compatibility-mode' 'antibody'

# COMPLETITIONS
autoload -Uz promptinit && promptinit
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
_comp_options+=(globdots) # enable hidden files completion
zstyle ':completion:*' special-dirs false
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
  export LESSOPEN="|$(which lesspipe.sh) %s"
  export LESSCOLORIZER='bat'
  export PATH="$PATH:$HOME/.cargo/bin"
  export GOPATH="$HOME/.go"
  export PATH="$PATH:$GOPATH/bin"
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
  export PATH=$PATH:/usr/local/go/bin
  export GOPRIVATE="*"
fi

export PATH="$PATH:$HOME/.local/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

#export PATH="/home/vittorio/.krew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/vittorio/.cargo/bin:/usr/local/go/bin:/home/vittorio/.local/bin:/home/vittorio/.fzf/bin:/home/vittorio/.cargo/bin:/usr/local/go/bin:/home/vittorio/.local/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
