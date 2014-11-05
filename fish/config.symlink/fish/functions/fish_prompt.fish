#   ❯ >

function prompt_pwd2 --description "Tidier pwd"
  echo $PWD | sed -e "s|^$HOME|~|"

  # dividers between paths
  # echo $PWD | sed -e "s|^$HOME|~|" | sed -e "s|/|  |g"
  # echo $PWD | sed -e "s|^$HOME|~|" | sed -e "s|/| ❯ |g"

  # to colour dividers between paths
  # set -l dirs (echo $PWD | sed -e "s|^$HOME|~|" |tr '/' '\n')
  # set -l first 1
  # for dir in $dirs
  #   if test first -eq '1'
  #     set_color $fish_color_tm_selection
  #     # echo -n ' ❯ '
  #     echo -n '  '
  #     set -l first 0
  #   end
  #
  #   set_color $fish_color_tm_background
  #   echo -n $dir
  # end
end

function git_branch --description "Name of current git branch"
  set -l branch (git rev-parse --abbrev-ref HEAD ^/dev/null)
  test -n $branch; and echo ' '$branch' '
end

function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

  echo # newline

  if not test $last_status -eq -0
    set_color $fish_color_error -b $fish_color_operator
    echo -n 
  end

  set_color $fish_color_tm_background -b $fish_color_operator
  echo -n ' '(prompt_pwd2)' '

  set_color $fish_color_operator -b $fish_color_tm_selection
  echo -n 

  set_color $fish_color_comment -b $fish_color_tm_selection
  echo -n (git_branch)

  set_color $fish_color_tm_selection -b normal
  echo -n 
  set_color $fish_color_comment

  echo # newline
  echo -n '❯ '
end
