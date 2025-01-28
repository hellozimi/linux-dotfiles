source ~/.aliases
source ~/.functions
source ~/.exports
source ~/.path

fpath+=($HOME/zsh/pure)

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
HISTDUP=erase

setopt share_history
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_verify

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

autoload -U promptinit; promptinit
prompt pure

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)

bindkey -r "^[c"

autoload -Uz compinit

# fnm
FNM_PATH="/home/simon/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/simon/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# pnpm
export PNPM_HOME="/home/simon/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/home/simon/.bun/_bun" ] && source "/home/simon/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
FNM_PATH="/home/simon/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/simon/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
