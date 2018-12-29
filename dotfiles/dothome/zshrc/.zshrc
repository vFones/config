# shells vars
export TERM="xterm-256color"
export SHELL="/bin/zsh"
export EDITOR="vim"
bindkey "^?" backward-delete-char

# history vars
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=9999
export SAVEHIST=$HISTSIZE

# language environment
#export LANG=it_IT.UTF-8

# ZSH VARS
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"
#disable root warning
ZSH_DISABLE_COMPFIX=true

######################################
##            ALIASES               ##
######################################
alias q="exit"
alias vi="vim"
alias vimconf="vi ~/.vimrc"
alias zshconf="vi ~/.zshrc"
alias ls="ls --color=auto"
alias sl="ls"
alias ll="k -h"
alias la="k -ha"
alias ..="cd .."
alias ...="cd ../.."
alias nf="neofetch --bold off --block_range 0 7 --colors 4 6 8 3 5 7" 
alias raspy="ssh 192.168.2.231"

######################################
##            ZPLUG                 ##
######################################
[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh

zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, from:github, at:next, as:theme
zplug "b4b4r07/enhancd", use:init.sh
zplug "supercrabtree/k"
zplug "tarruda/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"

zplug "lib/completion",            from:oh-my-zsh
zplug "lib/key-bindings",          from:oh-my-zsh
zplug "plugins/sudo",              from:oh-my-zsh
zplug "plugins/docker",            from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh

# check if there are plugins to install
if ! zplug check; then
  printf "Install plugins? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

if zplug check "b4b4r07/enhancd"; then
  ENHANCD_FILTER="fzy"
  ENHANCD_COMMAND="cd"
fi

if zplug check "bhilburn/powerlevel9k"; then
  DEFAULT_FOREGROUND=109 DEFAULT_BACKGROUND=235 PROMPT_COLOR=173
 
  DEFAULT_COLOR="clear"
  
  P9K_MODE="nerdfont-complete"
  P9K_STATUS_VERBOSE=false
  P9K_DIR_SHORTEN_LENGTH=1
  
  P9K_DIR_OMIT_FIRST_CHARACTER=true
  
  P9K_CONTEXT_ALWAYS_SHOW=true
  P9K_CONTEXT_ALWAYS_SHOW_USER=false
  P9K_LEFT_SUBSEGMENT_SEPARATOR_ICON="%F{232}"
  P9K_RIGHT_SUBSEGMENT_SEPARATOR_ICON="%F{232}"
  P9K_LEFT_SEGMENT_SEPARATOR_ICON=" "
  P9K_RIGHT_SEGMENT_SEPARATOR_ICON=" "
 
  P9K_PROMPT_ON_NEWLINE=true
  P9K_RPROMPT_ON_NEWLINE=false
  
  P9K_STATUS_VERBOSE=true
  P9K_STATUS_CROSS=true
  
  P9K_MULTILINE_FIRST_PROMPT_PREFIX_ICON="%F{$PROMPT_COLOR}%f"
  P9K_MULTILINE_LAST_PROMPT_PREFIX_ICON="%F{$PROMPT_COLOR} ➜ %f"
  P9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator context dir dir_writable vcs)
  P9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time time)
  
  P9K_VCS_GIT_GITHUB_ICON=""
  P9K_VCS_GIT_BITBUCKET_ICON=""
  P9K_VCS_GIT_GITLAB_ICON=""
  P9K_VCS_GIT_ICON=""
  
  P9K_VCS_CLEAN_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_VCS_CLEAN_FOREGROUND="142"
  P9K_VCS_MODIFIED_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_VCS_MODIFIED_FOREGROUND="214"
  P9K_VCS_UNTRACKED_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_VCS_UNTRACKED_FOREGROUND="214"
  
  P9K_DIR_HOME_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_DIR_HOME_FOREGROUND="109"
  P9K_DIR_HOME_SUBFOLDER_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_DIR_HOME_SUBFOLDER_FOREGROUND="109"
  P9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="214"
  
  P9K_DIR_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_DIR_DEFAULT_FOREGROUND="109"
  P9K_DIR_ETC_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_DIR_ETC_FOREGROUND="109"
  P9K_DIR_NOT_WRITABLE_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_DIR_NOT_WRITABLE_FOREGROUND="109"
  
  P9K_ROOT_INDICATOR_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_ROOT_INDICATOR_FOREGROUND="208"
  
  P9K_STATUS_OK_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_STATUS_OK_FOREGROUND="142"
  P9K_STATUS_ERROR_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_STATUS_ERROR_FOREGROUND="167"
  
  P9K_TIME_ICON="\uF017" # 
  P9K_TIME_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_TIME_FOREGROUND="175"

  P9K_OS_ICON_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_OS_ICON_FOREGROUND="175"
  
  P9K_COMMAND_EXECUTION_TIME_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_COMMAND_EXECUTION_TIME_FOREGROUND="172"
  P9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
  P9K_COMMAND_EXECUTION_TIME_PRECISION=1
  
  P9K_BACKGROUND_JOBS_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_BACKGROUND_JOBS_FOREGROUND="109"
  
  P9K_USER_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_USER_SUDO_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_USER_ROOT_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_USER_DEFAULT_ICON="\uF415" # 
  P9K_ROOT_INDICATOR_ICON=" \uF198 "  # 

  P9K_CONTEXT_TEMPLATE="\uF109 %m"
  P9K_CONTEXT_SUDO_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_CONTEXT_SUDO_FOREGROUND="142"
  P9K_CONTEXT_ROOT_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_CONTEXT_ROOT_FOREGROUND="142"
  P9K_HOST_LOCAL_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_HOST_LOCAL_FOREGROUND="142"
  P9K_HOST_LOCAL_ICON="\uF109 " # 
  P9K_CONTEXT_DEFAULT_FOREGROUND="142"
  P9K_CONTEXT_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
  
  ## Unusued stuff
  #P9K_CONTEXT_REMOTE_BACKGROUND="$DEFAULT_BACKGROUND"
  #P9K_CONTEXT_REMOTE_FOREGROUND="123"
  #P9K_CONTEXT_REMOTE_SUDO_BACKGROUND="$DEFAULT_BACKGROUND"
  #P9K_CONTEXT_REMOTE_SUDO_FOREGROUND="123"
  #P9K_HOST_REMOTE_ICON="\uF489 "  # 
  #P9K_HOST_REMOTE_BACKGROUND="$DEFAULT_BACKGROUND"
  #P9K_SSH_ICON="\uF489 "  # 
  #P9K_SSH_BACKGROUND="$DEFAULT_BACKGROUND"
  #P9K_SSH_FOREGROUND="212"
fi

zplug load

if zplug check zsh-users/zsh-autosuggestions; then
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}")
fi

if zplug check zsh-users/zsh-history-substring-search; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi
