# curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
# fisher install decors/fish-ghq
# curl -L https://get.oh-my.fish | fish
# omf install bobthefish
# omf install peco

set -g theme_color_scheme terminal-dark
set -g theme_newline_cursor no
set -g theme_display_date no
set -g theme_show_exit_status no

set -x PATH $HOME/.anyenv/bin $PATH
eval (anyenv init - | source)

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

set GHQ_SELECTOR peco

function fish_right_prompt
  #intentionally left blank
end


alias g 'git'
alias ga 'git add'
alias gaa 'git add --all'
alias gb 'git branch'
alias gc 'git commit -v'
alias gcm 'git checkout master'
alias gco 'git checkout'
alias gcp 'git cherry-pick'
alias gd 'git diff'
alias gf 'git fetch'
alias gfa 'git fetch --all --prune'
alias ggu 'git pull --rebase origin (current_branch)'
alias ggpush 'git push origin (current_branch)'
alias gp 'git push'
alias gpsup 'git push -u origin (current_branch)'
alias grbom 'git rebase origin/master'

function current_branch -d "Output git's current branch name"
  begin
    git symbolic-ref HEAD; or \
    git rev-parse --short HEAD; or return
  end 2>/dev/null | sed -e 's|^refs/heads/||'
end
