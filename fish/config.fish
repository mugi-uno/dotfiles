# curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
# fisher install decors/fish-ghq
# curl -L https://get.oh-my.fish | fish
# omf install bobthefish
# omf install peco

set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_color_scheme terminal-dark
set -g theme_newline_cursor no
set -g theme_display_date no

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

set GHQ_SELECTOR peco
