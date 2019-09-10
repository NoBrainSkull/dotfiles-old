load=light

# Enforce navigation power-keys
bindkey -e
bindkey "^[[H" vi-beginning-of-line # Start
bindkey "^[[F"       vi-end-of-line # End
bindkey "^[[1;5C"    forward-word # Ctrl+Right
bindkey "^[[1;5D"   backward-word # Ctrl+Left
bindkey ";2A"          up-history # Shift+Up
bindkey ";2B"        down-history # Shift+Down
bindkey "^[[5~"        up-history # PageUp
bindkey "^[[6~"      down-history # PageDown
bindkey "^[[3~"       delete-char # Suppr

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

zplugin $load willghatch/zsh-saneopt
zplugin $load mafredri/zsh-async
zplugin $load rupa/z
zplugin ice silent wait:1 atload:_zsh_autosuggest_start
zplugin $load zsh-users/zsh-autosuggestions
zplugin ice blockf
zplugin $load zsh-users/zsh-completions
zplugin ice silent wait:1; zplugin $load supercrabtree/k
zplugin ice silent wait!1 atload"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit"
zplugin $load zdharma/fast-syntax-highlighting

export SPACESHIP_VI_MODE_SHOW=false