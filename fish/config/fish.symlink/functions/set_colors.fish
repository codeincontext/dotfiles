function set_colors
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
