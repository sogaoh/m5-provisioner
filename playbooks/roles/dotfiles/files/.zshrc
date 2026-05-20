#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# Customize to your needs...

# Iceberg iTerm2 Color
export CLICOLOR=1


# zsh-completion 
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

# history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# share .zshhistory
setopt inc_append_history
setopt share_history


# peco
function peco-repos() {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-repos
bindkey '^R' peco-repos

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^H' peco-history-selection

if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi

function peco-cdr () {
    local selected_dir="$(cdr -l | sed -E 's/^[0-9]+ +//' | peco --prompt="cdr >" --query "$LBUFFER")"
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N peco-cdr
bindkey '^F' peco-cdr
#bindkey '^D' peco-cdr

# refs [Docker イメージの断捨離を圧倒的に効率化する](https://qiita.com/hoto17296/items/791936ae4e809feec7cf)
function peco-docker-images() {
  local images="$(docker images | tail +2 | sort | peco --prompt 'DOCKER IMAGES>' | awk '{print $3}' ORS=' ')"
  [ -z "$images" ] && return
  BUFFER="$LBUFFER$images$RBUFFER"
  CURSOR=$#BUFFER
}

zle -N peco-docker-images
bindkey '^x^i' peco-docker-images


# aqua
export AQUA_GLOBAL_CONFIG=/Volumes/crucial-p5/m2-provisioner/aqua/aqua.yaml
export PATH="$(aqua root-dir)/bin:$PATH"


# gcloud 
## refs https://zenn.dev/choimake/articles/1abc277f1bffac
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"


# anyenv
eval "$(anyenv init -)"


# bun completions
[ -s "/Users/sogaoh/.bun/_bun" ] && source "/Users/sogaoh/.bun/_bun"
# bun
#export BUN_INSTALL="$HOME/.bun"
#export PATH="$BUN_INSTALL/bin:$PATH"


# zsh-abbr
source "/opt/homebrew/share/zsh-abbr/zsh-abbr.zsh"


# mysql-client,psql PATH
export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"


# volta
#export VOLTA_HOME="$HOME/.volta"
#export VOLTA_FEATURE_PNPM=1
#export PATH="$VOLTA_HOME/bin:$PATH"


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


ZSHHOME="${HOME}/.zsh.d"
if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && source $i
    done
fi

# Created by `pipx` on 2023-11-02 12:51:08
export PATH="$PATH:/Users/sogaoh/.local/bin"

# deno completion
fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u


# saml2aws 
eval "$(saml2aws --completion-script-zsh)"
# @see https://github.com/Versent/saml2aws/tree/master?tab=readme-ov-file#saml2aws-script
#alias s2a="function(){eval $( $(command saml2aws) script --shell=bash --profile=$@);}"


# tenv completion
[ -f ~/.tenv.completion.zsh ] && source ~/.tenv.completion.zsh


# direnv
eval "$(direnv hook zsh)"


# mise
eval "$(mise activate zsh)"

# Terragrunt: use terraform instead of tofu
export TG_TF_PATH=$(which terraform)

# brew の aqua を優先しないように
#export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"


# unalias:最後に
#unalias mysql
