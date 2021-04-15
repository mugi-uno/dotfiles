# curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
# fisher install decors/fish-ghq
# curl -L https://get.oh-my.fish | fish
# omf install bobthefish
# omf install peco

set -g theme_color_scheme terminal-dark
set -g theme_newline_cursor no
set -g theme_display_date no
set -g theme_show_exit_status no

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

set GHQ_SELECTOR peco

function fish_right_prompt
  #intentionally left blank
end
