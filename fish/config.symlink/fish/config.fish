set fish_color_normal c5c8c6
set fish_color_command 81a2be
set fish_color_quote de935f
set fish_color_redirection b294bb
set fish_color_end b294bb
set fish_color_error cc6666
set fish_color_param 81a2be
set fish_color_comment 969896
set fish_color_match 8abeb7
set fish_color_search_match b294bb
set fish_color_operator 8abeb7
set fish_color_escape 8abeb7
set fish_color_cwd b5bd68

set fish_color_tm_selection 373b41
set fish_color_tm_background 1d1f21

set -x PATH /usr/local/bin $PATH # homebrew
set PATH $HOME/.dotfiles/bin $PATH # bins in dotfiles repo

set -x EDITOR vim

set fish_greeting '' # turn off greeting

set -gx RBENV_ROOT /usr/local/var/rbenv
. (rbenv init -|psub)
