# My fish prompt

function fish_prompt

  if test $WINDOW
    set_color black
    set_color -b green
    printf "%s" $WINDOW
    set_color normal
    set_color -b normal
    printf " "
  end

  if test $VIRTUAL_ENV
    set_color blue
    printf "{%s} " (basename $VIRTUAL_ENV)
    set_color normal
  end

  printf "%s" (__fish_git_prompt "[%s] ")

  set user (whoami)
  set host (hostname)

  set_color red
  printf "$user@$host "

  set_color yellow
  printf (prompt_pwd)

  set_color cyan
  echo
  printf '> '
end
