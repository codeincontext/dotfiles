if status --is-interactive
  eval sh $HOME/.config/base16-shell/base16-ocean.dark.sh

  set BASE_03 65737e

  # will need to tweak this over time. not sure about the contrast between command, param, and quote atm
  set -g fish_color_autosuggestion    $BASE_03
  set -g fish_color_command           normal
  set -g fish_color_comment           $BASE_03
  set -g fish_color_cwd               green
  set -g fish_color_cwd_root          red
  set -g fish_color_end               purple
  set -g fish_color_error             red
  set -g fish_color_escape            cyan
  set -g fish_color_history_current   cyan
  set -g fish_color_host              cyan
  set -g fish_color_match             cyan
  set -g fish_color_normal            normal
  set -g fish_color_operator          cyan
  set -g fish_color_param             blue
  set -g fish_color_quote             cyan
  set -g fish_color_redirection       cyan
  set -g fish_color_search_match      \x2d\x2dbackground\x3dpurple
  set -g fish_color_selection         \x2d\x2dbackground\x3dpurple
  set -g fish_color_status            red
  set -g fish_color_user              \x2do\x1egreen
  set -g fish_color_valid_path        \x2d\x2dunderline
  set -g fish_pager_color_completion  normal
  set -g fish_pager_color_description $BASE_03
  set -g fish_pager_color_prefix      cyan
  set -g fish_pager_color_progress    cyan

end

set -x PATH /usr/local/bin $PATH # homebrew
set PATH $HOME/.dotfiles/bin $PATH # bins in dotfiles repo

set -x EDITOR nvim
# set -x RBENV_VERSION

set -x FZF_DEFAULT_COMMAND 'ag -l -g ""'

set fish_greeting '' # turn off greeting

# my vim config prints an ACTIVE_VIM_BUFFFER_PATH session env. We want this to
# be accessible through $V
# function -e fish_preexec set_active_vim_file_env
#   set -l BUFFER_PATH (tmux show-environment ACTIVE_VIM_BUFFER_PATH ^/dev/null)
#   if test $BUFFER_PATH
#     set -g V (echo $BUFFER_PATH | sed "s:^.*=::")
#   end
# end

function set_abbreviations
  abbr -a ga   git add
  abbr -a gap  git add -p
  abbr -a gc   git commit
  abbr -a gcm  git commit -m
  abbr -a gco  git checkout
  abbr -a gs   git status -s
  abbr -a gb   git branch
  abbr -a gd   git diff

  abbr -a .. cd ..
  abbr -a ll ls -ll
end

set_abbreviations

set -u fish_user_paths $fish_user_paths /usr/local/var/rbenv/shims
set -gx RBENV_ROOT /usr/local/var/rbenv
# . (rbenv init -|psub)

archey
