# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
source ~/.bash_profile
source ~/.bashrc
# Path to your oh-my-zsh installation.
export ZSH="/Users/hannad/.oh-my-zsh"

ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
#DISABLE_UPDATE_PROMPT="true"
#ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g "" --ignore .git --ignore-dir node_modules --ignore-dir dist --ignore-dir bower_files --ignore-dir bower_components --ignore tags --ignore yarn.lock'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias fedir="cd ~/workspace/web-frontend"
alias bedir="cd ~/workspace/navihealth/"
alias msdir="cd ~/workspace/apps/mock-server/"
alias bdr="bedir"
alias fdr="fedir"
alias msd="msdir"
alias v="nvim"
alias reload="source ~/.zshrc"
alias fe="fedir && v"
alias be="bedir && v"
alias ms="msdir && v"
alias vc="v ~/.config/nvim/init.vim"
alias zconfig="v ~/.zshrc"
alias dev="~/workspace/apps/shell-scripts/tmux-session.sh"
alias explore="vifm"
alias vim="v"
alias vi="v"



pyclean () {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type f -name "*.py[co]" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name ".mypy_cache" -delete
}
