### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
  zdharma-continuum/zinit-annex-as-monitor \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk

### ------------------------------------------------------------

# Environment
export PATH=~/.npm-global/bin:$PATH


# MegaLLM Configuration
export ANTHROPIC_BASE_URL="https://ai.megallm.io"
export ANTHROPIC_API_KEY="sk-mega-0d8e7f7de68c73e155334907d4b9f6452b549dee01204b47de05b929254d2b5e"


# Starship
eval "$(starship init zsh)"


# Enable completion system
zmodload zsh/complist
autoload -Uz compinit; compinit
_comp_options+=(globdots)  # Include dotfiles in completion


# Plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light jeffreytse/zsh-vi-mode

zinit light Aloxaf/fzf-tab # 必须放最后


# cdreplay
zinit cdreplay -q


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# fzf-tab configuration
zstyle ':fzf-tab:*' fzf-flags --bind=tab:accept
zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza --tree --level=3 --color=always --icons=always $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview '
    if [[ -d $realpath ]]; then
        eza --tree --level=3 --color=always --icons=always $realpath
    else
        bat -n --color=always --line-range :500 $realpath
    fi
'

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^r' fzf-history-search

# History
HISTSIZE=5000
HISTFILE=~/.config/zsh/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups


# alias
alias ls="eza --color=always --long --git --icons=always --no-user"
alias lsa="ls -a"
alias n="nvim"
alias mkdir="mkdir -p"

# bat config
alias cat="bat"
export BAT_THEME="Catppuccin Mocha"

# the fuck
eval "$(thefuck --alias)"
eval "$(thefuck --alias fk)"

# zoxide
eval "$(zoxide init zsh)"
alias cd="z"




# fzf config
source <(fzf --zsh)

export FZF_DEFAULT_OPTS="--bind='tab:accept'"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --strip-cwd-prefix --exclude .git "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --strip-cwd-prefix --exclude .git "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always --icons=always --level=3 {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --icons=always --level=3 {} | head -200'"

_fzf_comprun() {
  local command="$1"
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always --icons=always --level=3 {} | head -200' "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}


stty -ixon


