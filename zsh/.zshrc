# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config//zsh//.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f "${ZDOTDIR}/aliases.zsh" ] && source "${ZDOTDIR}/aliases.zsh"
[ -f "${ZDOTDIR}/completion.zsh" ] && source "${ZDOTDIR}/completion.zsh"
[ -f "${ZDOTDIR}/env.zsh" ] && source "${ZDOTDIR}/env.zsh"
[ -f "${ZDOTDIR}/functions.zsh" ] && source "${ZDOTDIR}/functions.zsh"
[ -f "${ZDOTDIR}/keybindings.zsh" ] && source "${ZDOTDIR}/keybindings.zsh"
[ -f "${ZDOTDIR}/options.zsh" ] && source "${ZDOTDIR}/options.zsh"
[ -f "${ZDOTDIR}/plugins.zsh" ] && source "${ZDOTDIR}/plugins.zsh"
[ -f "${ZDOTDIR}/prompt.zsh" ] && source "${ZDOTDIR}/prompt.zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# history
HISTSIZE=110000
SAVEHIST=100000
HISTFILE=~/.histfile

# export BROWSER=brave

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[OA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OB' history-substring-search-down
bindkey -M vicmd '^[[A' history-substring-search-up
bindkey -M vicmd '^[OA' history-substring-search-up
bindkey -M vicmd '^[[B' history-substring-search-down
bindkey -M vicmd '^[OB' history-substring-search-down
bindkey -M viins '^[[A' history-substring-search-up
bindkey -M viins '^[OA' history-substring-search-up
bindkey -M viins '^[[B' history-substring-search-down
bindkey -M viins '^[OB' history-substring-search-down

# colours
autoload -U colors && colors	    # colours
autoload -U compinit && compinit    # basic completion
autoload -U compinit colors zcalc   # theming

# tab completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)--color=auto}"                        # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                                                # automatically find new executables in path
zstyle ':completion:*' menu select                                                # Highlight menu selection

# completion
zstyle :compinstall ~/.config/zsh/.zshrc

autoload -Uz compinit
compinit

eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source "$ZDOTDIR/.p10k.zsh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
