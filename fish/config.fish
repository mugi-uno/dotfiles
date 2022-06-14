# Preinstall: fisher
#   see: https://github.com/jorgebucaran/fisher
#
# brew install fzf
# brew install zoxide
# brew install gitui
#
# fisher install decors/fish-ghq
# fisher install jethrokuan/fzf
# curl -L https://get.oh-my.fish | fish
# omf install bobthefish
# omf install peco

set -g theme_color_scheme terminal-dark
set -g theme_newline_cursor no
set -g theme_display_date no
set -g theme_show_exit_status no
#set -g theme_display_git_dirty no
set -g theme_display_git_untracked no

set -g theme_display_git_dirty no
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose no
set -g theme_display_git_dirty_verbose no
set -g theme_display_git_stashed_verbose no

set -x PATH $HOME/.anyenv/bin $PATH

status --is-interactive; and source (anyenv init -|psub)

set GHQ_SELECTOR fzf

function fish_right_prompt
  #intentionally left blank
end

bind \cf zi

alias g 'git'
alias ga 'git add'
alias gaa 'git add --all'
alias gb 'git branch'
alias gc 'git commit -v'
alias gcm 'git checkout main'
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
alias kb 'kubectl'
alias gui 'gitui'
alias d 'docker'
alias dc 'docker-compose'

function current_branch -d "Output git's current branch name"
  begin
    git symbolic-ref HEAD; or \
    git rev-parse --short HEAD; or return
  end 2>/dev/null | sed -e 's|^refs/heads/||'
end

zoxide init fish | source

