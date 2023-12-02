# Updated 8.10.22 (manually, curl)
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# functions
set_python_runtime() {
    if [ "$1" = "for_venv" ]; then
        alias python='venv/bin/python3'
        echo 'On '"$(python --version)"' (local)'
    else
        pydir=$(brew --prefix python)
        alias python="$pydir/bin/python3"
        echo 'On '"$(python --version)"' (global)'
    fi
}

# navigation aliases
alias v='nvim'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias k='cd ~'
alias d='cd ~/Documents/Development'
alias jsd='cd ~/Documents/Development/JavaScript'
alias dt='cd ~/Desktop'
alias fa='cd ~/Documents/Development/JavaScript/github-repos/forest-app'
alias fas='cd ~/Documents/Development/JavaScript/github-repos/forest-app; ng serve'
alias rpg='cd ~/Documents/Development/JavaScript/react-pground'
alias lqssh='ssh -i id_ed25519 kha@conway-ssh.liqd.net'
alias lq='cd ~/Documents/Development/LIQD'
alias venv='source venv/bin/activate && set_python_runtime for_venv'
alias dvenv='deactivate && set_python_runtime'

# command aliases
alias ls='ls -alrt -G'
alias s='git status'
alias b='git branch'
alias a='git add .'
alias co='git checkout '
alias po='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias hist='git log --oneline --graph --decorate --all'
alias zshreload='source ~/.zshrc'
alias weather='curl v2.wttr.in'
alias upconfig='cp -R ~/Documents/Development/devconfigs/{.vim,.gitconfig,.zshenv,.zshrc,.zshrceval} ~/'
alias puconfig='cp -rf ~/{.vim,.gitconfig,.zshenv,.zshrc,.zshrceval} ~/Documents/Development/devconfigs/'
alias pip=pip3
alias makepy='make clean && /usr/local/bin/python -m venv venv && make install && make watch'

# tmux aliases
alias :q='exit'
alias tmx='tmux'

# lazygit aliases
alias lg='lazygit'

# work aliases
alias wd='cd $ENV'
alias lqdeploy='ssh build@build.liqd.net deploy '
alias lqbuild='ssh build@build.liqd.net build '
alias docrun='docker-compose run app sh -c '

# dotfiles-bare alias
alias dot='/usr/bin/git --git-dir=$HOME/Repos/dotfiles-bare.git/ --work-tree=$HOME'

# open chrome with localhost
alias oc="open -a 'Google Chrome' http://localhost:4200"

# python3 alias
set_python_runtime

# fzf searcher
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '^[[A' fzf-history-widget

path+='/usr/local/bin/flake8'
path+='/usr/local/bin'
export PATH="/Users/khamui:$PATH"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


# Load Angular CLI autocompletion.
# source <(ng completion script)
