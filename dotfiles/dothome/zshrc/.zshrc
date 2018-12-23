# shells vars
export TERM="xterm-256color"
export SHELL="/bin/zsh"
export EDITOR="vim"
bindkey "^?" backward-delete-char

# history vars
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=9999
export SAVEHIST=$HISTSIZE

# color formatting for man pages
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;36m'     # begin blink
export LESS_TERMCAP_so=$'\e[1;33;44m'  # begin reverse video
export LESS_TERMCAP_us=$'\e[1;37m'     # begin underline
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
export MANPAGER='less -s -M -R +Gg'

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
alias raspy="ssh 192.168.2.231"

######################################
##            ZPLUG                 ##
######################################
[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh

zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, from:github, at:next, as:theme
zplug "b4b4r07/enhancd", use:init.sh
zplug "supercrabtree/k"

# suggestions
zplug "hlissner/zsh-autopair", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh

# check if there are plugins to install
if ! zplug check; then
  B
  printf "Install plugins? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

if zplug check "b4b4r07/enhancd"; then
  ENHANCD_FILTER="fzy"
  ENHANCD_COMMAND="cd"
fi

if zplug check "zsh-users/zsh-history-substring-search"; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi


if zplug check "bhilburn/powerlevel9k"; then
  DEFAULT_FOREGROUND=006 DEFAULT_BACKGROUND=235 PROMPT_COLOR=173
  DEFAULT_FOREGROUND=198 DEFAULT_BACKGROUND=090 PROMPT_COLOR=173
  DEFAULT_FOREGROUND=235 DEFAULT_BACKGROUND=159 PROMPT_COLOR=173
  DEFAULT_FOREGROUND=123 DEFAULT_BACKGROUND=059 PROMPT_COLOR=183
  DEFAULT_FOREGROUND=159 DEFAULT_BACKGROUND=238 PROMPT_COLOR=173
  DEFAULT_FOREGROUND=159 DEFAULT_BACKGROUND=239 PROMPT_COLOR=172
 
  DEFAULT_COLOR="clear"
  
  P9K_MODE="nerdfont-complete"
  P9K_STATUS_VERBOSE=false
  P9K_DIR_SHORTEN_LENGTH=1
  
  P9K_DIR_OMIT_FIRST_CHARACTER=false
  
  P9K_CONTEXT_ALWAYS_SHOW=true
  P9K_CONTEXT_ALWAYS_SHOW_USER=false
  P9K_LEFT_SUBSEGMENT_SEPARATOR_ICON="%F{232}\uE0BD%f"
  P9K_RIGHT_SUBSEGMENT_SEPARATOR_ICON="%F{232}\uE0BD%f"
  P9K_LEFT_SEGMENT_SEPARATOR_ICON='▓▒░'
  P9K_RIGHT_SEGMENT_SEPARATOR_ICON='░▒▓'
 
  P9K_PROMPT_ON_NEWLINE=true
  P9K_RPROMPT_ON_NEWLINE=false
  
  P9K_STATUS_VERBOSE=true
  P9K_STATUS_CROSS=true
  
  P9K_MULTILINE_FIRST_PROMPT_PREFIX_ICON="%F{$PROMPT_COLOR}%f"
  P9K_MULTILINE_LAST_PROMPT_PREFIX_ICON="%F{$PROMPT_COLOR}➜ %f"
  P9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator context dir dir_writable vcs)
  P9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode background_jobs command_execution_time time)
  
  P9K_VCS_GIT_GITHUB_ICON=""
  P9K_VCS_GIT_BITBUCKET_ICON=""
  P9K_VCS_GIT_GITLAB_ICON=""
  P9K_VCS_GIT_ICON=""
  
  P9K_VCS_CLEAN_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_VCS_CLEAN_FOREGROUND="010"
  P9K_VCS_MODIFIED_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_VCS_MODIFIED_FOREGROUND="011"
  P9K_VCS_UNTRACKED_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_VCS_UNTRACKED_FOREGROUND="011"
  
  P9K_DIR_HOME_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_DIR_HOME_FOREGROUND="158"
  P9K_DIR_HOME_SUBFOLDER_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_DIR_HOME_SUBFOLDER_FOREGROUND="158"
  P9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="$DEFAULT_BACKGROUND"
  
  P9K_DIR_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_DIR_DEFAULT_FOREGROUND="158"
  P9K_DIR_ETC_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_DIR_ETC_FOREGROUND="158"
  P9K_DIR_NOT_WRITABLE_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_DIR_NOT_WRITABLE_FOREGROUND="158"
  
  P9K_ROOT_INDICATOR_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_ROOT_INDICATOR_FOREGROUND="red"
  
  P9K_STATUS_OK_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_STATUS_OK_FOREGROUND="green"
  P9K_STATUS_ERROR_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_STATUS_ERROR_FOREGROUND="red"
  
  P9K_TIME_ICON="\uF017" # 
  P9K_TIME_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_TIME_FOREGROUND="183"
  
  P9K_COMMAND_EXECUTION_TIME_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
  P9K_COMMAND_EXECUTION_TIME_PRECISION=1
  
  P9K_BACKGROUND_JOBS_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_BACKGROUND_JOBS_FOREGROUND="123"
  
  P9K_USER_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_USER_SUDO_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_USER_ROOT_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_USER_DEFAULT_ICON="\uF415" # 
  P9K_ROOT_INDICATOR_ICON='\uF198'  # 

  P9K_CONTEXT_TEMPLATE="\uF109 %m"
  P9K_CONTEXT_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_CONTEXT_DEFAULT_FOREGROUND="123"
  P9K_CONTEXT_SUDO_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_CONTEXT_SUDO_FOREGROUND="123"
  P9K_CONTEXT_REMOTE_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_CONTEXT_REMOTE_FOREGROUND="123"
  P9K_CONTEXT_REMOTE_SUDO_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_CONTEXT_REMOTE_SUDO_FOREGROUND="123"
  P9K_CONTEXT_ROOT_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_CONTEXT_ROOT_FOREGROUND="123"
  
  P9K_HOST_LOCAL_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_HOST_REMOTE_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_HOST_LOCAL_ICON="\uF109 " # 
  P9K_HOST_REMOTE_ICON="\uF489 "  # 
  
  P9K_SSH_ICON="\uF489 "  # 
  P9K_SSH_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_SSH_FOREGROUND="212"
  P9K_OS_ICON_BACKGROUND="$DEFAULT_BACKGROUND"
  P9K_OS_ICON_FOREGROUND="212"
fi

zplug load

#echo " "
#neofetch --bold off --block_range 0 7 --colors 4 6 8 3 5 7 
