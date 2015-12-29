eval sh $HOME/.config/base16-shell/base16-ocean.dark.sh

set -x PATH /usr/local/bin $PATH # homebrew
set PATH $HOME/.dotfiles/bin $PATH # bins in dotfiles repo

set -x EDITOR nvim
set -x RBENV_VERSION

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
  abbr -a gco  git checkout
  abbr -a gcm  git commit
  abbr -a gcmm git commit -m
  abbr -a gs   git status -s
  abbr -a gb   git branch
end

set_abbreviations

set -u fish_user_paths $fish_user_paths /usr/local/var/rbenv/shims
set -gx RBENV_ROOT /usr/local/var/rbenv
# . (rbenv init -|psub)

archey
