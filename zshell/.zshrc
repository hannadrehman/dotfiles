# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
ZSH_DISABLE_COMPFIX=true
export ZSH="/Users/hannadurrehman/.oh-my-zsh/"
source ~/.bashrc
ZSH_THEME="robbyrussell"
#ZSH_THEME="spaceship"
HYPHEN_INSENSITIVE="true"
#DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export FZF_DEFAULT_COMMAND='ag -g "" --ignore .git --ignore-dir node_modules --ignore-dir dist --ignore-dir bower_files --ignore-dir bower_components --ignore tags --ignore yarn.lock'
#export FZF_DEFAULT_COMMAND = "rg --files --hidden --follow --glob '!.git'"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias fedir="cd ~/workspace/web-frontend"
alias bedir="cd ~/workspace/navihealth"
alias msdir="cd ~/workspace/projects/mock-server"
alias v="nvim"
alias reload="source ~/.zshrc"
alias fe="fedir && v"
alias be="bedir && v"
alias ms="msdir && v"
alias vc="v ~/.config/nvim/init.vim"
alias zconfig="v ~/.zshrc"
alias dev="~/workspace/shell-scripts/work-shell/tmux-shell-script.sh"
alias explore="vifm"
alias vim="v"
alias vi="v"
alias jj="ssh jj"

pyclean () {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type f -name "*.py[co]" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name ".mypy_cache" -delete
}
