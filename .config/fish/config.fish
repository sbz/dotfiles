set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '?'
set __fish_git_prompt_char_stagedstate '!'
set __fish_git_prompt_char_untrackedfiles '~'
set __fish_git_prompt_char_stashstate ''
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

set __fish_git_prompt_project (git config --local remote.origin.url|sed -n 's#.*/\([^.]*\)\.git#\1#p')

function fish_git_project_name
    set pname (git config --local remote.origin.url|sed -n 's#.*/\([^.]*\)\.git#\1#p')
    if "$pname"
        echo $pname
    else
        set T (git rev-parse --show-toplevel)
        echo (basename $T)
    end
        
end

function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s %s ' (__fish_git_prompt) (git config --local remote.origin.url|sed -n 's#.*/\([^.]*\)\.git#\1#p')

  set_color normal
end
