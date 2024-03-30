# krause.zsh-theme

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function virtualenv_info {
    [ $CONDA_DEFAULT_ENV ] && echo "($CONDA_DEFAULT_ENV) "
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '⠠⠵' && return
    echo '○'
}

function box_name {
  local box="${SHORT_HOST:-$HOST}"
  [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
  echo "${box:gs/%/%%}"
}

PROMPT="%{$FG[223]%}╭─%{$reset_color%} %{$FG[138]%}%n%{$reset_color%} %{$FG[223]%}at%{$reset_color%} %{$FG[029]%}$(box_name)%{$reset_color%} %{$FG[223]%}in%{$reset_color%} %{$terminfo[bold]$FG[015]%}%~%{$reset_color%}\$(git_prompt_info)\$(ruby_prompt_info) %{$reset_color%}%{$FG[223]%}%D - %*
%{$FG[223]%}╰─\$(virtualenv_info)\$(prompt_char) "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[223]%}on%{$reset_color%} %{$FG[011]%}%{$reset_color%} %{$FG[223]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[208]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[010]%}"
ZSH_THEME_RUBY_PROMPT_PREFIX=" %{$FG[239]%}using%{$FG[243]%} ‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"
