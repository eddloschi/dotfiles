#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

GREEN="\[$(tput setaf 2)\]"
BLUE="\[$(tput setaf 14)\]"
YELLOW="\[$(tput setaf 3)\]"
GRAY="\[$(tput setaf 240)\]"
RESET="\[$(tput sgr0)\]"

exitstatus()
{
  STATUS=$?
  if [[ $STATUS != 0 ]]; then
    echo "$(tput setaf 9)${STATUS}$(tput sgr0) "
  fi
}

source /usr/share/git/git-prompt.sh

export PS1="${BLUE}\u${RESET} ${YELLOW}\w${RESET}${GRAY}\$(__git_ps1 ' (%s)')${RESET} ${GREEN}\$${RESET} "
export PS2="${GREEN}  >${RESET} "

export HISTCONTROL=ignoredups
export VISUAL="vim"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pyserver='python -m http.server'
alias yayup='yay -Syu --combinedupgrade'
alias exa='exa -lgh'

source /usr/share/doc/pkgfile/command-not-found.bash
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

eval "$(pipenv --completion)"

shopt -s autocd
shopt -s checkwinsize

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
