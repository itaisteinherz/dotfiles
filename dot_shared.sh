# Common utilities and configurations (shared between zsh and bash)

# fnm
export PATH=$HOME/.fnm:$PATH
eval "`fnm env`"

# Python (user installation directory)
export PATH=$HOME/.local/bin:$PATH

# Set Vim to be the default editor
export EDITOR=vim

# Set up Linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Some ls aliases
alias ls='ls --color=tty' # for pretty output
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -alh'

# For pretty grep output
alias grep='grep --color=auto'

# WSL-related utilities
source ~/.wsl.sh
