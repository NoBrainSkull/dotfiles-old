load=light

# Enforce navigation power-keys
bindkey -e
bindkey "^A" vi-beginning-of-line # Ctrl+A
bindkey "^E"       vi-end-of-line # Ctrl+E
bindkey "^[[1;5C"    forward-word # Ctrl+Right
bindkey "^[[1;5D"   backward-word # Ctrl+Left
bindkey ";2A"          up-history # Shift+Up
bindkey ";2B"        down-history # Shift+Down
bindkey "^[[5~"        up-history # PageUp
bindkey "^[[6~"      down-history # PageDown

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