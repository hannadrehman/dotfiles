# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
# source hannad
ZSH_DISABLE_COMPFIX=true
export ZSH="/Users/hanad/.oh-my-zsh/"
source ~/.bashrc
eval $(thefuck --alias fuck)


# ZSH_THEME="powerlevel10k/powerlevel10k"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
ENABLE_CORRECTION="false"

unsetopt correct_all
unsetopt correct

export THEFUCK_REQUIRE_CONFIRMATION=false
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias fedir="cd ~/workspace/"
alias bedir="cd ~/workspace/"
alias msdir="cd ~/workspace/projects/mock-server"
alias v="nvim"
alias reload="source ~/.zshrc"
alias fe="fedir && v"
alias be="bedir && v"
alias ms="msdir && v"
alias dev="~/workspace/personal/dotfiles/tmux/tmux-shell-script.sh"
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#this might change in future
# source /usr/local/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

