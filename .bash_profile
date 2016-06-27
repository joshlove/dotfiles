# Settings for all shells
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

#Environment variables
export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less
export CVS_RSH=ssh
export LESS="-RM"
export NODE_PATH=/usr/local/lib/node_modules
export PATH=$HOME/bin:/usr/local/share/npm/bin:/usr/local/share/python:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

HISTCONTROL=ignoreboth
HISTSIZE=10000000
HISTFILESIZE=10000000
shopt -s histappend

# Bash
case "$(uname)" in
  *Darwin*) ls_options=-lahG ;;
  *) ls_options=-lah ;;
esac

## only binds the given termcap entr(y|ies) to a widget if the terminal supports it
termcap_bind() {
  local widget=$1 key termcap
  shift
  for termcap ; do
    key="$(tput $termcap)"
    [ -n "$key" ] && bind "\"$key\": $widget"
  done
}

# Simulate Zsh's preexec hook (see: http://superuser.com/a/175802/73015 )
# (This performs the histappend at a better time)
simulate_preexec() {
  [ -n "$COMP_LINE" ] || # skip if doing completion
    [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] || # skip if generating prompt
    history -a
}
trap simulate_preexec DEBUG

#command prompt customization
prompt() {
  local last_status=$?
  local WHITE="\[\033[1;37m\]"
  local GREEN="\[\033[0;32m\]"
  local CYAN="\[\033[0;36m\]"
  local GRAY="\[\033[0;37m\]"
  local BLUE="\[\033[0;34m\]"
  local LIGHT_BLUE="\[\033[1;34m\]"
  local YELLOW="\[\033[1;33m\]"
  local RED="\[\033[1;31m\]"
  local no_color='\[\033[0m\]'
  local time="${YELLOW}\d \@$no_color"
  local whoami="${GREEN}\u@\h$no_color"
  local dir="${CYAN}\w$no_color"

  local branch
  if git rev-parse --git-dir >/dev/null 2>/dev/null ; then
    branch=$(git branch | awk '/^\*/ { print $2 }')
    branch="${branch:+$LIGHT_BLUE$branch }"
  else
    unset branch
  fi

  local last_fail
  if test $last_status -ne 0 ; then
    last_fail="=> ${YELLOW}Err: $last_status${no_color}\n"
  else
    unset last_fail
  fi

  #PS1="\n$time $whoami $branch$dir\n$last_fail$driver$no_color \$ "
  PS1="$whoami $branch$dir $last_fail$driver$no_color \$ "
}
PROMPT_COMMAND=prompt
# retain $PROMPT_DIRTRIM directory components when the prompt is too long
PROMPT_DIRTRIM=3

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

source ~/.aliases
