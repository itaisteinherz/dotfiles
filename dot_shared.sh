# Common utilities and configurations (shared between zsh and bash)

# fnm
if [ -x $HOME/.fnm ]; then
	export PATH=$HOME/.fnm:$PATH
	eval "`fnm env`"
fi

# Python (user installation directory)
export PATH=$HOME/.local/bin:$PATH

# Go
export PATH=$PATH:/usr/local/go/bin

# Set Vim to be the default editor
export EDITOR=vim

# Set up Linuxbrew
if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Enable color support of ls and grep
if [ -x /usr/bin/dircolors ]; then
	test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Aliases
source $HOME/.aliases.sh

# WSL-related utilities
source $HOME/.wsl.sh
