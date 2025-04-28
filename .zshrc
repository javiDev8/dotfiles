# prompt
autoload -U colors && colors
PS1="
%{$fg[yellow]%}%~%{$reset_color%} %{$fg[red]%}% %(?..%? )% %{$reset_color%}
▶ "

# aliases
alias l="ls -alh"
alias g="grep"
alias sd="sudo"
alias f="ranger"
alias suspend="systemctl suspend"
alias arcli="arduino-cli"
alias sys="systemctl"
alias killx="kill $(pidof Xorg)"
alias dotfiles="git --git-dir $HOME/.dotfiles --work-tree $HOME"
# vi like
bindkey -v

# path
path+=('/home/jdev/scripts')
export PATH

export EDITOR=nvim
export LOG="-- logs --"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
exec startx
fi
export PATH="$HOME/development/flutter/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
