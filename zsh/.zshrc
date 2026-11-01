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
functions[prompt_pure_preprompt_render_orig]=$functions[prompt_pure_preprompt_render]
prompt_pure_preprompt_render() {
    [[ ${prompt_pure_vcs_info[branch]} == jj/keep/* ]] && prompt_pure_vcs_info[branch]=${${prompt_pure_vcs_info[branch]#jj/keep/}[1,8]}
    prompt_pure_preprompt_render_orig "$@"
}
