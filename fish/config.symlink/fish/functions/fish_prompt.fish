# I want to use the blue-grey colors in ocean but when you enter the hex, fish
# only searches the 240 colours after the standard ones, skipping the bright
# palette
set prompt_bg_2 343D46
set prompt_bg_1 blue

#   ❯ >

function prompt_pwd2 --description "Tidier pwd"
  echo $PWD | sed -e "s|^$HOME|~|"
end

function git_branch --description "Name of current git branch"
  set -l branch (git rev-parse --abbrev-ref HEAD ^/dev/null)
  test -n $branch; and echo ' '$branch' '
end

function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

  echo # newline

  if not test $last_status -eq -0
    set_color red -b $prompt_bg_1
    echo -n 
  end

  # set_color $dir_fg_color -b $fish_color_operator
  set_color black -b $prompt_bg_1
  echo -n ' '(prompt_pwd2)' '

  set_color $prompt_bg_1 -b $prompt_bg_2
  echo -n 

  set_color $fish_color_comment
  echo -n (git_branch)

  set_color $prompt_bg_2 -b normal
  echo -n 
  set_color $fish_color_comment

  echo # newline
  echo -n '❯ '
end
