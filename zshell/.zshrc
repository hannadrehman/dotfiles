
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# Initialization code for rbenv, zoxide, fnm, and pyenv.
# Must run before Powerlevel10k instant prompt to avoid console output warnings.
eval "$(rbenv init - zsh)"
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(pyenv virtualenv-init -)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh-My-Zsh Configuration
export ZSH="/Users/hannadrehman/.oh-my-zsh"
ZSH_DISABLE_COMPFIX=true
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins and features
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Environment variables
export BAT_THEME="Dracula"
export EDITOR="nvim"
export PATH=$PATH:$HOME/Library/Android/sdk/emulator
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH="/Users/hannadrehman/.rd/bin:$PATH" # Managed by Rancher Desktop
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Aliases
alias v="nvim"
alias reload="source ~/.zshrc"
alias dev="~/workspace/projects/dotfiles/shell/tmux-shell-script.sh"
alias vim="v"
alias vi="v"
alias cat=bat

# Functions
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

# Source additional tools
# . "/Users/hannadrehman/.deno/env"
source <(fzf --zsh)

# Load Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/hannadrehman/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# bun completions
[ -s "/Users/hanad/.bun/_bun" ] && source "/Users/hanad/.bun/_bun"

export PATH="$HOME/.local/bin:$PATH"


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

# opencode
export PATH=/Users/hanad/.opencode/bin:$PATH

# Entire CLI shell completion
autoload -Uz compinit && compinit && source <(entire completion zsh)

# hr-agents update check hook
[ -f "${HOME}/.hr-agents/shell/hr-agents-init.sh" ] && source "${HOME}/.hr-agents/shell/hr-agents-init.sh"
