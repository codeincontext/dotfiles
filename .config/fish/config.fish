if status --is-interactive
 set_colors
end

set -x PATH /usr/local/bin $PATH # homebrew

set -x EDITOR emacsclient
set -x RBENV_VERSION

set -x FZF_DEFAULT_COMMAND 'ag -l --hidden -g ""'

set fish_greeting '' # turn off greeting

set_abbreviations

status --is-interactive; and source (rbenv init -|psub)

function fish_greeting
  archey --offline
end
