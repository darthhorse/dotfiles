## Catalina Bash deprecation message
export BASH_SILENCE_DEPRECATION_WARNING=1

## .local/bin
export PATH="${PATH}:/Users/harry/.local/bin"

## Keybindings
set -o vi

## source .bash_alias file
test -f ${HOME}/.bash_aliases && . $_

## ls colours
export CLICOLOR=1

## So you won't shoot yourself in the foot
set -o noclobber
alias mv='mv -i'
alias cp='cp -i'

## Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
base16_tomorrow-night

## Git branch prompt
parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
      
}
export PS1='\u \[\033[01;32m\][\W]\[\033[m\]\[\033[01;32m\]$(parse_git_branch)\[\033[m\] \$ '

## Bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}

# conda config --set auto_activate_base false
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/harry/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/harry/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/harry/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/harry/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

