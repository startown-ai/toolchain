# Oh My Zsh
export ZSH="/usr/share/oh-my-zsh"

plugins=(z zsh-autosuggestions zsh-syntax-highlighting)

zstyle ':omz:update' mode disabled

source $ZSH/oh-my-zsh.sh

# Pure prompt
fpath+=(/usr/share/zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# Shorten jj's detached HEAD (jj/keep/<hash>) to 8 characters
+vi-jj-keep() {
    [[ ${hook_com[branch]} == jj/keep/* ]] && hook_com[branch]=${${hook_com[branch]#jj/keep/}[1,8]}
}
zstyle ':vcs_info:git*+set-message:*' hooks jj-keep
