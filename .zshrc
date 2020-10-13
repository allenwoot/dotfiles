[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=/Users/allenwu/repos/credit_card/product/dashboard/node_modules/.bin:$PATH
export PATH=/Users/allenwu/repos/credit_card/script/preview-environments:$PATH
export PATH=/Users/allenwu/work/bin:$PATH

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' (%b)'
#  # Set up the prompt (with git branch name)
setopt PROMPT_SUBST
autoload -U colors && colors
PROMPT='%{$fg[green]%}${PWD/#$HOME/~}%{$reset_color%}%{$fg[yellow]%}${vcs_info_msg_0_}%{$reset_color%} %{$fg[green]%}> %{$reset_color%}'

#echo 'command -v nodenv &> /dev/null && eval "$(nodenv init -)"' >> ~/.zshrc

# Cycle through history based on characters already typed on the line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

export BREX_DEV_NAMESPACE=awu@brex.com

[ -s "/Users/allenwu/.scm_breeze/scm_breeze.sh" ] && source "/Users/allenwu/.scm_breeze/scm_breeze.sh"

alias auth="keymaster -username=awu && cg-client"
alias ls="ls -al"
alias zr="source ~/.zshrc"
alias zrc="vim ~/.zshrc"
alias vrc="vim ~/.vimrc"
alias grom="git checkout main && git pull --rebase && git checkout - && git rebase main"
alias gpf='git push -f'
alias h="history"
alias br=". ~/.bash_profile"
alias gp='git push'
alias ga.='git add .'
alias gca='git commit --amend'
alias gs="git status"
alias gd="git diff"
alias gb="git branch"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gdm="git diff main"
alias gcm="git checkout main"
alias gcp="git checkout production"
alias gpom="git pull --rebase origin main"
alias gpop="git pull --rebase origin production"
alias grm="git rebase main"
alias grc="git rebase --continue"
alias gacp="git add . && git commit --amend && git push -f"
alias gg="git checkout main && git pull --rebase origin main"
alias gc-="git checkout -"
alias gc.="git checkout ."
alias gco="git checkout"
alias gcb=gitcheckoutallenbranch
gitcheckoutallenbranch() {
  git checkout -b allenwu/$1
}

alias c="cd ~/repos/credit_card"
alias d="cd ~/repos/credit_card/product/dashboard"
alias bp="cd ~/repos/credit_card/product/dashboard/src/domains/BillPay"
alias rk="keymaster -username=awu && cg-client"

alias stg-kubectl="kubectl --context staging --namespace staging"

cd ~/repos/credit_card/

command -v nodenv &> /dev/null && eval "$(nodenv init -)"
