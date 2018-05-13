# Used to show right color palette
export TERM="xterm-256color"
 
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="minimal"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
#export LANG=it_IT.UTF-8

# Preferred editor for local and remote sessions

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

alias zshconf="vi ~/.zshrc"
alias q="exit"
alias lls="ls -lha"
alias sl="ls"
alias shutdown="sudo shutdown now"
# Powerline theme configuration

   #POWERLEVEL9K_MODE=''

#Path to your oh-my-zsh installation.
export ZSH=$HOME/config/dotfiles/oh-my-zsh/.oh-my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(web-search sudo)
source $ZSH/oh-my-zsh.sh


POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=( status root_indicator time)	
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( dir_writable dir)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_ROOT_ICON=''
  
#    POWERLEVEL9K_OS_ICON_BACKGROUND='magenta'
#    POWERLEVEL9K_OS_ICON_FOREGROUND='black'
#    POWERLEVEL9K_DIR_HOME_BACKGROUND='green'
#    POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
#    POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='yellow'
#    POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'
#    POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='green'
#    POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'

POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_LOCK_ICON_BACKGROUND='red'
POWERLEVEL9K_LOCK_ICON_FOREGROUND='black'
POWERLEVEL9K_OS_ICON_BACKGROUND='white'
POWERLEVEL9K_OS_ICON_FOREGROUND='black'
POWERLEVEL9K_STATUS_BACKGROUND='red'
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND='yellow'
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND='black'
POWERLEVEL9k_STATUS_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_BACKGROUND='green'
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='yellow'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='green'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
POWERLEVEL9K_DIR_WRITABLE_BACKGROUND='red'
POWERLEVEL9K_DIR_WRITABLE_FOREGROUND='black'

    #POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{white}\u256D\u2500%F{white}"
   # POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%F{white}\u2570\uf460%F{white} "
    
POWERLEVEL9K_TIME_BACKGROUND="magenta"
POWERLEVEL9K_TIME_FOREGROUND="black"

# Source for font maps
#source ~/.fonts/*.sh 

# CORRECT PATH
#export PATH=~/pebble-dev/pebble-sdk-4.5-linux64/bin:$PATH

#Showing command at first launch   
#neofetch --bold off --block_range 0 7 --colors 4 6 8 3 5 7 
