if status --is-interactive
 set_colors
end

set -x PATH /usr/local/bin $PATH # homebrew

set -x EDITOR emacsclient
# set -x RBENV_VERSION

set -x FZF_DEFAULT_COMMAND 'ag -l --hidden -g ""'

set fish_greeting '' # turn off greeting

set_abbreviations

set -u fish_user_paths $fish_user_paths /usr/local/var/rbenv/shims
set -gx RBENV_ROOT /usr/local/var/rbenv
# . (rbenv init -|psub)

archey
