# Used to show right color palette
export TERM="xterm-256color"

#ZSH_THEME="norm"
ZSH_THEME="powerlevel9k/powerlevel9k"

export UPDATE_ZSH_DAYS=7
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

# You may need to manually set your language environment
#export LANG=it_IT.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='vim'
fi

#Path to your oh-my-zsh installation.
export ZSH=$HOME/.src/config/dotfiles/dothome/oh-my-zsh/.oh-my-zsh/oh-my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(sudo git)


#for root warning
ZSH_DISABLE_COMPFIX=true

#Oh my zsh source
source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliasesalias vi="vim"
alias vi="vim"
alias vimconf="vi ~/.vimrc"
alias zshconf="vi ~/.zshrc"
alias q="exit"
alias sl="ls"
alias raspy="ssh pi@192.168.2.231"
alias vpn="sudo systemctl restart openvpn.service"
alias ll="exa -l --git --time-style=long-iso --group-directories-first"
alias la="exa -la --git --time-style=long-iso --group-directories-first"
alias lah="exa -lahg --git --time-style=long-iso --group-directories-first"



# Powerline theme configuration
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=( status root_indicator time)	
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( dir_writable dir vcs)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_ROOT_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=' '
POWERLEVEL9K_FOLDER_ICON=' '
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
POWERLEVEL9K_TIME_BACKGROUND="magenta"
POWERLEVEL9K_TIME_FOREGROUND="black"

neofetch --bold off --block_range 0 7 --colors 4 6 8 3 5 7 
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
