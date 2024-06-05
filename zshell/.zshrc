# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(rbenv init - zsh)"
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
# source hannad
ZSH_DISABLE_COMPFIX=true
export ZSH="/Users/hanad/.oh-my-zsh/"


ZSH_THEME="powerlevel10k/powerlevel10k"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
ENABLE_CORRECTION="false"
BAT_THEME="Dracula"
EDITOR="nvim"
unsetopt correct_all
unsetopt correct

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias v="nvim"
alias reload="source ~/.zshrc"
alias dev="~/workspace/projects/dotfiles/shell/tmux-shell-script.sh"
alias vim="v"
alias vi="v"
alias cat=bat

pyclean () {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type f -name "*.py[co]" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name ".mypy_cache" -delete
}


function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#this might change in future
 #source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
 source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

source <(fzf --zsh)
