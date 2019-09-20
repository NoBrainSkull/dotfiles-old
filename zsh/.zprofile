# Loading mode
load=light

# Enforce navigation power-keys

autoload up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -v
[[ -n "$terminfo[kpp]"   ]] && bindkey "$terminfo[kpp]"   up-line-or-beginning-search   # PAGE UP
[[ -n "$terminfo[knp]"   ]] && bindkey "$terminfo[knp]"   down-line-or-beginning-search # PAGE DOWN
[[ -n "$terminfo[khome]" ]] && bindkey "$terminfo[khome]" beginning-of-line             # HOME
[[ -n "$terminfo[kend]"  ]] && bindkey "$terminfo[kend]"  end-of-line                   # END
[[ -n "$terminfo[kdch1]" ]] && bindkey "$terminfo[kdch1]" delete-char                   # DELETE
[[ -n "$terminfo[kbs]"   ]] && bindkey "$terminfo[kbs]"   backward-delete-char          # BACKSPACE
[[ -n "$terminfo[kcbt]"   ]] && bindkey "$terminfo[kcbt]" reverse-menu-complete          # SHIFT+TAB

bindkey "^A"      beginning-of-line     "^E"      end-of-line
bindkey "^?"      backward-delete-char  "^H"      backward-delete-char
bindkey "^W"      backward-kill-word    "\e[1~"   beginning-of-line
bindkey "\e[7~"   beginning-of-line     "\e[H"    beginning-of-line
bindkey "\e[4~"   end-of-line           "\e[8~"   end-of-line
bindkey "\e[F"    end-of-line           "\e[3~"   delete-char
bindkey "^J"      accept-line           "^M"      accept-line
bindkey "^T"      accept-line           "^R"      history-incremental-search-backward
bindkey '^[[1;5C' forward-word          '^[[1;5D' backward-word               
bindkey "^K"      kill-line             "^U"      backward-kill-line

# Autoloads
zmodload -i zsh/complist
autoload -Uz allopt zed zmv zcalc colors
colors

autoload -Uz select-word-style
select-word-style shell

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Option for directory stack handling
setopt auto_pushd         # Make cd push the old directory onto the directory stack. 
setopt pushd_ignore_dups  # Don’t push multiple copies of the same directory onto the directory stack. 
setopt pushdminus         # Exchanges the meanings of ‘+’ and ‘-’ when used with a number to specify a directory in the stack.
unsetopt menu_complete    # do not autoselect the first completion entry
unsetopt flowcontrol      # If this option is unset, output flow control via start/stop characters (usually assigned to ^S/^Q) is disabled in the shell’s editor. 
setopt auto_menu          # show completion menu on successive tab press
setopt complete_in_word   # Complete from both ends instead of character position
setopt always_to_end      # After completion is validated, move cursor to then end of the word

# Extends zplugin compatibility with Oh-my-zsh themes
setopt promptsubst
zplugin snippet OMZ::lib/git.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin $load "https://github.com/denysdovhan/spaceship-prompt/"

# zplugin $load willghatch/zsh-saneopt                                        # Baseline providing sensible defaults everyone wants anyway
zplugin $load mafredri/zsh-async                                              # Enforce the terminal to be able to perform tasks asynchronously
zplugin $load rupa/z                                                          # Provide a `z` to jump based on most visited directories
zplugin ice blockf
zplugin $load zsh-users/zsh-completions                                       # Additional completion definitions for Zsh
zplugin ice silent wait:1; zplugin $load supercrabtree/k                      # Add a super-powered `k` command to list content of folders
zplugin ice silent wait!1 atload"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit"
zplugin ice blockf
zplugin $load zdharma/fast-syntax-highlighting                                # Highlight zsh syntax
zplugin snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh                   # Load uncrypted asymetric keys to perform ssh without inputing passphrase everytime.
zplugin $load zsh-users/zsh-history-substring-search                          # Look into history filtering with inputed text
zplugin ice silent wait:1; zplugin $load lukechilds/zsh-nvm                   # Load nvm's default nodejs version
zplugin ice wait lucid
zplugin load hlissner/zsh-autopair                                            # Auto close matching pattern while typing
zstyle ":history-search-multi-word" page-size "11"
zplugin ice wait"1" lucid
zplugin load zdharma/history-search-multi-word

# Global ENV_VARS
export SPACESHIP_VI_MODE_SHOW=false
export TERMINAL=/usr/bin/kitty
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export PATH="$PATH:/home/blue/.dotnet/tools"

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ":completion:*:descriptions" format "%B%d%b"
zstyle ':completion:*:*:*:default' menu yes select search
zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”

function double-accept { deploy-code "BUFFER[-1]=''"; }
zle -N double-accept
bindkey -M menuselect '^F' history-incremental-search-forward
bindkey -M menuselect '^R' history-incremental-search-backward
bindkey -M menuselect ' ' double-accept
